package org.exoplatform.addons.codefest.team_i;

import javax.annotation.security.RolesAllowed;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.CacheControl;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.exoplatform.container.ExoContainer;
import org.exoplatform.container.ExoContainerContext;
import org.exoplatform.services.log.ExoLogger;
import org.exoplatform.services.log.Log;
import org.exoplatform.services.rest.resource.ResourceContainer;
import org.exoplatform.services.security.ConversationState;
import org.exoplatform.calendar.service.Calendar;
import org.exoplatform.calendar.service.CalendarEvent;
import org.exoplatform.calendar.service.CalendarService;
import org.exoplatform.calendar.service.CalendarSetting;
import org.exoplatform.calendar.service.EventQuery;
import org.exoplatform.calendar.service.GroupCalendarData;



@Path("/taskmanagement")
public class TaskManagementRESTServiceTeamI implements ResourceContainer
{
    private static final Log LOG = ExoLogger.getLogger(TaskManagementRESTServiceTeamI.class);
    static CacheControl cc = new CacheControl();
    static {
      cc.setNoCache(true);
      cc.setNoStore(true);
    }
    private CalendarService calService;  
	private final ExoContainer container;
    public TaskManagementRESTServiceTeamI(ExoContainerContext ctx) {
        this.container = ctx.getContainer();
        calService = (CalendarService)container.getComponentInstanceOfType(CalendarService.class);
    }
	
    @GET
    @RolesAllowed("users")
    @Path("task/add")
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public Response createTask(
    	  @QueryParam("calendarid") String calendarid, 
          @QueryParam("name") String name,
          @QueryParam("description") String description,
          @QueryParam("startdate") String startdate,
          @QueryParam("enddate") String enddate,
          @QueryParam("participants") String participants,
          @QueryParam("priority") String priority) throws Exception {
    	
        CalendarEvent calendarEvent;
        Calendar defaultCalendar;
        
        /* Start prototype, get the first calendar*/
        String username = ConversationState.getCurrent().getIdentity().getUserId();
        defaultCalendar = calService.getUserCalendars(username, true).get(0);
        calendarid = defaultCalendar.getId();
        /* End of prototype*/
        
        calendarEvent = new CalendarEvent();
        calendarEvent.setEventType(CalendarEvent.TYPE_TASK) ;
        calendarEvent.setSummary(name);
        calendarEvent.setDescription(description);
        calendarEvent.setFromDateTime(parseDateTime(startdate));
        calendarEvent.setToDateTime(parseDateTime(enddate));
        calendarEvent.setCalendarId(calendarid);
        try {
            int priorityInt = Integer.parseInt(priority);
            if (priorityInt < 0 || priorityInt >= CalendarEvent.PRIORITY.length) {
            	throw new Exception(); 
            }
            priority =  CalendarEvent.PRIORITY[priorityInt]; 
        } catch (Exception e){
        	LOG.info("Priority can not be " + priority + ". The default is in used" );
        	priority = CalendarEvent.PRIORITY[0];
        }
        calendarEvent.setPriority(priority);        
        if(defaultCalendar.isPublic()) {
        	calService.savePublicEvent(calendarid, calendarEvent, true);
        }else {
        	calService.saveUserEvent(username, calendarid, calendarEvent, true) ;
        }
        return Response.ok("true", MediaType.APPLICATION_JSON).cacheControl(cc).build();
    }
    
    @GET
    @RolesAllowed("users")
    @Path("task/edit")
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public Response updateTaskStatus(
    	  @QueryParam("taskid") String taskid, 
          @QueryParam("status") String newStatus) throws Exception {
      CalendarEvent calendarEvent;
      newStatus = getRightState(newStatus);
      String username = ConversationState.getCurrent().getIdentity().getUserId();
      calendarEvent = calService.getEvent(username, taskid);
      calendarEvent.setEventState(newStatus);
      List<CalendarEvent> listEvent = new ArrayList<CalendarEvent>();
      listEvent.add(calendarEvent);
      String fromCalendar = calendarEvent.getCalendarId();
      String calType = calendarEvent.getCalType();
      calService.moveEvent(fromCalendar, fromCalendar, calType, calType, listEvent, username);
      return Response.ok("true", MediaType.APPLICATION_JSON).cacheControl(cc).build();
    }
  
    
    @GET
    @RolesAllowed("users")
    @Path("task/get")
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public Response updateTaskStatus(@QueryParam("status") String status) throws Exception {
      String username = ConversationState.getCurrent().getIdentity().getUserId();
      List<CalendarEvent> eventList = getEventsByStatus(username, status);
      String ret = "{ \"events\": [";
      for (CalendarEvent evt : eventList) {
        ret += "\"value\": \"" + evt.getId() + "\",";
      }
      ret += "]}";
      return Response.ok(ret, MediaType.APPLICATION_JSON).cacheControl(cc).build();
    }
  
    public static Date parseDateTime(String dateString) {
        if (dateString == null) return null;
	    DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ");
	    if (dateString.contains("T")) dateString = dateString.replace('T', ' ');
	    if (dateString.contains("Z")) dateString = dateString.replace("Z", "+0000");
	        else
	    dateString = dateString.substring(0, dateString.lastIndexOf(':')) + dateString.substring(dateString.lastIndexOf(':')+1);
	    try {
	        return fmt.parse(dateString);
	    }
	    catch (ParseException e) {
	        LOG.error("Could not parse datetime: " + dateString, e);
	        return null;
	    }
	}
    /* get all calendar of a user*/
    private String[] getCalendarsIdList(String username) {
        StringBuilder sb = new StringBuilder();
        List<GroupCalendarData> listgroupCalendar = null;
        List<org.exoplatform.calendar.service.Calendar> listUserCalendar = null;
        try {
            listgroupCalendar = calService.getGroupCalendars(getUserGroups(username), true, username);
            listUserCalendar = calService.getUserCalendars(username, true);
        } catch (Exception e) {
            LOG.error("Error while checking User Calendar :" + e.getMessage(), e);
        }
        for (GroupCalendarData g : listgroupCalendar) {
            for (org.exoplatform.calendar.service.Calendar c : g.getCalendars()) {
                sb.append(c.getId()).append(",");
            }
        }
        for (org.exoplatform.calendar.service.Calendar c : listUserCalendar) {
            sb.append(c.getId()).append(",");
        }
        String[] list = sb.toString().split(",");
        return list;
    }
    private List<CalendarEvent> getEventsByStatus(String rUsername, String status) {
        String[] calList = getCalendarsIdList(rUsername);
        EventQuery eventQuery = new EventQuery();
        eventQuery.setEventType(CalendarEvent.TYPE_TASK);
        eventQuery.setState(getRightState(status));
        eventQuery.setCalendarId(calList);
        List<CalendarEvent> userEvents = null;
        try {
        	userEvents =  calService.getEvents(rUsername, eventQuery, calList);
        } catch (Exception e)
        {
        	LOG.info("Exception during get userEvent");
        	return null;
        }
        return userEvents;
    }
    /*Verify states*/
    private String getRightState(String state) {
        try {
            int stateInt = Integer.parseInt(state);
            if (stateInt < 0 || stateInt >= CalendarEvent.TASK_STATUS.length) {
            	throw new Exception(); 
            }
            state =  CalendarEvent.TASK_STATUS[stateInt]; 
        } catch (Exception e){
        	LOG.info("State can not be " + state + ". The default is in used" );
        	state = CalendarEvent.TASK_STATUS[0];
        }
        return state;
    }
    public String[] getUserGroups(String username) throws Exception {
    	Set<String> groupsSet = ConversationState.getCurrent().getIdentity().getGroups();
    	String[] groups = groupsSet.toArray(new String[groupsSet.size()]);
        return groups;
    }

}

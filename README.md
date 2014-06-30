D2 Task Management - CodeFest 2014 team I
===========
**Task drag and drop, easier than ever**

<img src="https://app.box.com/representation/file_version_15946621028/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" width=30% height=30% />

# The team I

TEAM MEMBER | EXO TEAM
------------ | ------------- 
Nguyen Thanh Van | BD
Nguyen Bao An | CWI
Tran Nguyen Son Tung | SN/ITOP
Tran Trung Thanh | GSS

# Introduction

Getting the idea from the whiteboard where we have the scrum meeting in front of it every morning of working days, we created the D2 Addon. In it, we can add a new task presented as a colorful sticker, then easy to drag and drop them to corresponding states (In Progress, Done, Cancelled) to play with it.

<img src="https://app.box.com/representation/file_version_15946622132/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" width=50% height=50% />

# Scope

This addon is designed to be compatible with eXo Platform 4.1.

<img src="https://app.box.com/representation/file_version_15946627692/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" />

# Specific Requirements

## Functions Requirements 

* Task management 
  * Add, edit tasks 
  * Change state task

* Integration with eXo (use calendar, etc with eXo component)

* HTML5, jquery, css, bootstrap component, 

* UI Design: flat design, color

## Use Cases

<img src="https://app.box.com/representation/file_version_16021388662/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" />

## Sequences

### View Task

<img src="https://app.box.com/representation/file_version_16021390278/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" />

### Status Change

<img src="https://app.box.com/representation/file_version_16021389518/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" />

### Task Creation

<img src="https://app.box.com/representation/file_version_16021387796/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" />

## User Interface Design

### Home Screen

<img src="https://app.box.com/representation/file_version_16022108650/image_2048_jpg/1.jpg?shared_name=ginql8g30t0gg1ju6xhw" />

### Add Task Popup Window

<img src="https://app.box.com/representation/file_version_15946624136/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" />

### Edit Task Popup Window

<img src="https://app.box.com/representation/file_version_15946625140/image_2048/1.png?shared_name=ginql8g30t0gg1ju6xhw" />

## Module Design

### REST Services

#### Add New Task

**Description:** Add new task to a specific calendar

_REST: /rest/taskmanagement/task/add?param1=value1&param2=value2_

Parameter | Definition
------------ | -------------
calendarid | Calendar ID to save
name | Task Summary
description | Task description
startdate | Start Date in JSON format
enddate | End Date in JSON format
participants | Task Delegator
priority | Task Priority (0: None, 1: Low, 2: Medium, 3: High)

#### Change task status

**Description:** Change status of a specific task
_REST: /rest/taskmanagement/task/edit?taskid=value&status=value_

Parameter | Definition
------------ | -------------
taskid	| Task ID to change
status	| Target status (0: Need action, 1: In progress, 2: Completed, 3: Cancelled)

#### Get tasks by status

**Description:** Get tasks by status
_REST: /rest/taskmanagement/task/get?status=value_

Parameter | Definition
------------ | -------------
status  | Target status (0: Need action, 1: In progress, 2: Completed, 3: Cancelled)

### UI Module

**Purpose:**

* Render tasks by status
* View task detail
* Create new task

# Implementaion

Technical Resources | 
------------ | -------------
**Github repository:** | git@github.com:exo-codefest/2014-team-I.git
**Build job:** | https://ci.exoplatform.org/job/addon-codefest-2014-team-I-master-ci
**Acceptance deployment job:** | https://ci.exoplatform.org/job/platform-community-4.1-M2-codefest-team_I-1.0.x-SNAPSHOT-deploy-acc
**Acceptance test url:** | http://codefest-4.1-m2-codefest-team_i.acceptance5.exoplatform.org

# References

_eXo Platform Calendar REST API: http://docs.exoplatform.com/PLF41/rest-api/calendar/_

# Get Started

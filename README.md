# openCX-nav-inc Development Report

Welcome to the documentation pages of the Campus NAV of **openCX**!

You can find here detailed about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 
Thank you!

> **Project developed by:**\
> :mortar_board: Francisco Gonçalves ([kiko-g](https://github.com/kiko-g))\
> :mortar_board: João Mota ([jppm99](https://github.com/jppm99))\
> :mortar_board: Luís Ramos ([luispvramos](https://github.com/LuisPRamos))\
> :mortar_board: Martim Silva ([motapinto](https://github.com/motapinto))\
> :mortar_board: Matheus Alves ([matheusstiehler](https://github.com/matheusstiehler))

---
## Product Vision :hourglass_flowing_sand:
```
Navigational application that focuses on helping attendees navigating in conference buildings.
```
---
## Elevator Pitch :iphone:
```
What is the most annoying thing when going to a conference meeting? 

Of course it is to find the places you want to go.

With Campus NAV you have a variaty of different information about the conference building you are in. You have 
access to all information about any conference taking place there (path, room, speakers, duration, ...) and also 
to the nearest routes to bathrooms, coffe machines, snack machines and even nearby bar's and restaurants. 

This way you can focus on the important things, connecting and learning.
```
---
## Requirements :satellite:
```
The application should give the user a realiable realtime location and provide up to date information about conference schedules.

For this, the application needs to keep a stable connection with the various beacons scaterred through the buildings.

Both connection with the various beacons and the user location will be achieved using bluetooth in conjuction with open source APIs.

An online database will need to be used to store conferences. To be maintained there must be a website to allow staff and developers change the information.
```

### Use case diagram :sparkler:  

![Use case diagram](/doc/useCases.jpg)

### Use Cases
* **Go to Conference**

**Actor**: Attendee

**Description**: After an attendee has arrived at a conference location, and has selected the conference, the application will guide him to the conference room.

**Preconditions**: Attendee has selected the conference that he would like to go to and has bluetooth turned on.

**Post-conditions**: App will search for optimal route. Attendee will be directed to the conference room.

**Normal Flow**:
1. The attendee turns bluetooth on.
2. The attendee will indicate that he wants to be guided to a conference he has selected.
3. The system will search for optimal route.
4. The attendee will follow directions given by the application.
5. The attendee will reach the conference location.
6. The application will issue a notification warning the user that he has arrived at the conference.

**Alternate Flows and Exceptions**:
The user goes off route -> The application must calculate new route.
The user is not in FEUP -> The application must give a warning and not calcute.
The user does not have bluetooth turned on -> The application needs to warn the user.

* **Visualize map**

**Actor**: Attendee

**Description**: The attendee presses the map button and the map will pop up and show his location on the map.

**Preconditions**: Attendee is in FEUP. Attendee has bluetooth turned on.

**Post-conditions**: Attendee will know where he is.

**Normal Flow**:
1. The attendee turns bluetooth on.
2. The attendee presses map button.
3. The application aquires his position.
4. The application shows the map.
5. The attendee knows is postion.

**Alternate Flows and Exceptions**:
The user is not in FEUP -> The application must give a warning and show map without position.
The user does not have bluetooth turned on -> The application needs to warn the user.


* **Go to places of interest**

**Actor**: Attendee

**Description**: After an attendee has arrived at a conference location, and has selected a point of interest (bathroom, coffee machine, bar, etc.), the application will guide him to it.

**Preconditions**: Attendee has selected a point of interest that he would like to go to and has bluetooth turned on.

**Post-conditions**: App will search for optimal route. Attendee will be directed to the point of interest.

**Normal Flow**:
1. The attendee turns bluetooth on.
2. The attendee will indicate that he wants to be guided to a point of interest he has selected.
3. The application will search for optimal route.
4. The attendee will follow directions given by the application.
5. The attendee will reach the point of interest location.
6. The application will issue a notification warning the user that he has arrived at the point of interest.

**Alternate Flows and Exceptions**:
The user goes off route -> The application must calculate new route.
The user is not in FEUP -> The application must give a warning and not calcute a route.
The user does not have bluetooth turned on -> The application needs to warn the user.

* **Check conference data**

**Actor**: Attendee

**Description**: After an attendee has opened the application he will go to homepage and see all conferences, when he presses the one he wants to know more about it will show him all available information about it.

**Preconditions**: Attendee has internet connection.

**Post-conditions**: App will acquire data from the online database. App will show all conferences returned from the database.

**Normal Flow**:
1. The attendee connects to the internet.
2. The attendee opens the application.
3. The application will acquire data from online database.
4. The application will show all conference data returned from database.
5. The attendee will choose conference that he wishes to see more about.
6. The application will show all data related to that conference.

**Alternate Flows and Exceptions**:
The user does not have internet connection -> The application needs to warn the user.

* **Modify Conferences**

**Actor**: Staff

**Description**: A staff member changes conferences listed on the database.

**Preconditions**: Staff has internet connection and is on the website.

**Post-conditions**: Website communicates with database and updates it.

**Normal Flow**:
1. The staff connects to the internet.
2. The staff goes to the database website.
3. The webiste will acquire data from database.
4. The staff will change conferences listed, possibly adding more or removing some.
5. The attendee will submit changes to database.
6. The website transmites changes to database.

**Alternate Flows and Exceptions**:
The information is not correct -> The website needs to warn the staff.

---
### User stories :arrow_double_down:
>**[(Trello / Github) synced user stories](https://github.com/kiko-g/feup-esof/issues?utf8=%E2%9C%93&q=is%3Aissue)**
>**[Trello Link](https://trello.com/b/XgQ9OzGB)**
---
### Domain Model :link:
>**[UML diagram](https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Domain%20Model.drawio#R7Vxbb%2BMoFP41eVmpke%2BXxyadzjx0pGrb1ew8rUhMYnZsY2HSpPPrF2xIbJMmnoTEE62rSjXHgPH5zoHvHHBH9jTdfCYgj7%2FiCCYjy4g2I%2FthZFmm4xrsD5e8V5IwtCrBkqBIVNoJXtBPKISi3XKFIlg0KlKME4rypnCOswzOaUMGCMHrZrUFTppPzcESKoKXOUhU6TcU0biSBpa%2Fk3%2BBaBnLJ5teWN1Jgaws3qSIQYTXNZH9aWRPCca0uko3U5hw5Um9VO0eP7i7HRiBGe3S4OU5%2FHszIV%2BK1xT8823x6vwbB3cCjDeQrMQLT3G2gKzPORTDpu9SF8UapQnIWGmywBl9EXcMVp7HKImewDte8bEUFMx%2FyNIkxgT9ZPVBwm6ZTMBuEyqgtjzeG0qSKU4wYYIMlw%2FYNXrhnYnHEFiwZs%2Fync2W6CvYNCo%2BgYLKAeIkAXmBZuWQecMUkCXKJphSnIpKqkqFlt8goXBTEwkVf4Y4hZS8syrirmcIuIW9%2B7K83lmP6QhZXLccWwiBsNjltu8dqOxC4PoLGNsKxiUACrzsDWmJDsE%2FYAuOPQiBBC0zVkzggjfjKkLMb%2B6FmOKcd5aDOcqWT2WdB2cn%2BVO8ORdh1naRlL4RoyiCGQcQU0DBbGtgOUYZLTXjTtgv09XUGLsjlw18ysrmrsx%2BeXVCmSWzdwGoxBIyU1hDbg57UD7oGsehF1AzU%2B6EtKynHWhHARpm0QCzZphdq2eYXQVmtoikA86acfaDnnH21YmbUaE5QTlFOBvw1oy3aTg9A%2B4peCsgswn9nrPaGlGiqeRVMGLUVdRlCozxEmcg%2BbSTfkxweNODSiIwARS9NVnxPg2Ips8c8B0tMv0mLXIDu9lFgVdkDkWrOottdWQbRzpi1GYJqdJRCcj2fc5wSgUjUwGpJJ81469BdMTrZoKNThIwg8mEEd8lwasskr47suxF%2BSMpeEWizf3k9ZCRiXhJjHIbPPwC070TL97ZMs7yjUDRuzEen6R6UnnyTev%2BqqoPFdX%2FVUCiqH6IDo%2FjZrcmL6djcCi5iHZsZZqlBm4GUjX0H8jFXpe4ndjQNBWgeeZrwFkvzr0Hh6YaNDzAN5jgfJiyT5uyzeac7XRN6ElT0A%2BxykGfGJ1YkQHhExflVsrW7hthT6Vcw6p8fLbeOsbtLMuWmsy7p5RF%2BXDYftHhy67bty87KvFSkK1ldSIEUpxFrzHiPsVuPCL%2BvFI%2FrCRhc1qZn4wN9W9ejXmUKH7ftmKFh02j9H5M41UW5ZDhjrrljep694Tez8wlOU47BdTaOeuaS2rv1bl%2B2Ozog1wSwwq816qJme7DAXtK8quxU8suqh61JqoclSUcsrtTsok1qzMMr2F3Yy%2BwjtheWXqGBLE3heRsg3Q6GqRm4%2FP9E43P9bnWdj%2Fm4W4vnNZ01PyaOR7%2FoVjMb53alCZ%2Fa7lNR6V7pyq%2Fx%2BSmPu1fVfmuGjC%2FxjCFxcC%2FTuBfVnN2DKyO9Mt0L7Zbrp6KKHisoeI7RFP7HeN2oilXjaYonMcD0rqR7j3N6ap75bNVgTJYDH6tHe3eT8K4Kjst5qg8ozq1RvfGALluyPs%2FDOOqpDjHCWLADB6uH%2B6uKe%2FLnX1SN6IVmPWlK66UJJNAXDopERpjy3cDzzK8IPRcOV0KcD2zdXqga4oiDMa%2B7VqhY5q%2B5%2FiG3%2BjWt9yxb7hBYFV1WglUTbmzsBlQeK5xeMgHq18m0%2BapGd4bS5xI5%2BshcbIfxrvWpmvbgvFiUcCLJMI8SwHzBnMx%2BgC9ai7G2%2FOpiojVjbsRH7yXcI3O2MWSX7wSVs96fARJAbc3ibwrJazGtkUVD%2FLePJDydT6bFXmt7hldywDkEn0LunuJriWrOq3vek9Kg24DUHyriEEOy0We8nV7HSMKXxj54rI1AXnT3QrhHs6HVK41wQoe98rvPdx5ehJfpuE2ZqzQ28Oo7D2Mqr15pc%2BZ1MTXxRjVdg%2Fye5Ne6WdU3nUYld%2FaGgzaX%2Bd15VBbXrQNrOzLEKX2iENx4u%2By1EdNuN0a9XF%2Bd%2BrTirguSH3UnNotUh9tgOrBs7UjcmdeC07%2FqhE138BurgFWcGQV0HwAQB6au%2FanTJ554tLQDlb9dkeaVgYWn%2B8d8IfjatWXZxE6v4d%2FhaDbV4PuUz8I6m%2Fx8fuLu8%2F7MlUNkm%2Fwayx92r%2Bu8lVe%2F3sv06YuNTtec6JRzuvp07HKa%2F8nOvaC1urWPojWgfE0j7JZzvmMhxV3%2Fyinqr77d0P2p%2F8A)**
---
## Architecture and Design :office:
### Logical architecture

![Logical diagram](doc/UML/Code_structure/architecture.svg)

### Physical architecture

![Deployment diagram](doc/UML/Deployment_diagram/Deployment_diagram.svg)
```
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.
```

```
It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications (Flutter vs ReactNative vs ...), languages to program with microbit, and communication with things (beacons, sensors, etc.).
```
### Prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe in more detail which, and how, user(s) story(ies) were implemented.

---

## Implementation
During implementation, while not necessary, it 

It might be also useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. 

Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.

---
## Test

#### Acceptance Tests
We have defined some acceptance tests using Gherkin, which can be found in our [Trello board](https://trello.com/b/XgQ9OzGB).
They are located in each user story (description).

For now they are only defined. The goal is for them to be automated in our application.

---
## Configuration and change management

Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).


---

## Project management :video_camera:

**[Trello Link](https://trello.com/b/XgQ9OzGB)**

The project management is done using [Trello](https://trello.com) with the following structure:

**BackLog**: User stories planned for the project that are not yet done.

**To Do**: User stories to be done in the upcoming weeks.

**Doing**: User stories that are currently being worked on.

**Done**: User stories that have already been done and successfully tested.


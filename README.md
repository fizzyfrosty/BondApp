## Synopsis

A test project for Bond databinding framework.

## Notes

This project is to test data binding with respect to MVVM architecture. The main structure of the app is that 

Storyboard and UI elements are created, and then references linked to the ViewController. This is effectively the initialization of the 'view' element in the MVVM architecture. The ViewController also plays a dual role here as the 'controller' element.

A corresponding 'view model' is initialized with arbitrary data.

The View Controller then binds the 'view model' to the 'view'. In a real world situation, this binding logic should be done in the 'view'.

A 'data model' is initialized with arbitrary data.

The 'data model' is then bound to the 'view model' in the ViewController. In an offline app, this binding logic should be done in the 'controller'. However, if we are dealing with retrieving data from an outside source, this may best be done in a 'data provider' where it is responsible for making web requests. This is because an event triggered by the view results in a flow of view -> viewModel -> dataModel/dataProvider -> webService -> dataProvider -> dataModel/viewModel -> view

Thus, the viewModel needs to be bound using the dataProvider's logic. 

The dataProvider may also be using a networkService for web communication. The networkService can be mocked in unit testing to test the dataProvider's binding logic.






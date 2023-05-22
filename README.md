# Clean Architecture in Flutter

Clean Architecture is a software design principle that promotes separation of concerns and maintainability by dividing the codebase into distinct layers. It emphasizes independence and testability, allowing for easier modification and scalability. In this PROJECT, we'll explore how to implement clean architecture in Flutter.

## Getting Started

To implement clean architecture in Flutter, we need to understand the core principles and structure of the architecture. Here are the key components:

![CleanArchitecture](https://github.com/sikandernoori/clean-architecture/assets/16399272/d41ad279-76f5-4978-b4c2-2d37a44be58b)

## 1. Entities
Entities represent the business models or objects used within the application. They encapsulate the core business logic and have no dependencies on other layers.

## 2. Use Cases (Interactors)
Use Cases contain the application's business rules and orchestrate the flow of data between the layers. They define the operations that can be performed on the entities and are independent of any specific framework or UI.

## 3. Interface Adapters
Interface Adapters handle the communication between the Use Cases and the external components, such as frameworks, databases, or APIs. They convert data to a format that is suitable for the Use Cases and handle any necessary data transformations.

## 4. Frameworks & Drivers
Frameworks and Drivers are the outermost layer of the architecture. They contain the UI components, database implementations, network services, and other external dependencies. They are responsible for handling the interaction between the application and the outside world.

## Clean Architecture & Flutter
In the context of Flutter, we can apply clean architecture by organizing our code into different layers:

![Clean-Architecture-Flutter-Diagram](https://github.com/sikandernoori/clean-architecture/assets/16399272/e505b780-2579-4f61-8b46-e73dbe2eb277)

## 1. Presentation Layer
The presentation layer in Flutter includes the UI components, such as widgets and screens. It interacts with the Use Cases through the interfaces defined in the Use Cases layer.

## 2. Domain Layer
The domain layer contains the Use Cases and Entities. It represents the business logic of the application and is independent of any framework-specific code.

## 3. Data Layer
The data layer is responsible for providing data to the application. It includes repository implementations, data sources, and external services. The data layer communicates with the domain layer through interfaces defined in the domain layer.

By following clean architecture principles, we can achieve a modular and testable codebase in Flutter. It allows us to make changes to one layer without affecting the others, ensuring maintainability and scalability of the application.

## Additional Resources
If you're interested in learning more about clean architecture, here are some recommended readings:

[The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) by Uncle Bob

[Flutter TDD Clean Architecture Course](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) by Reso Coder

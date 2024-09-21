## Naming specifications

### CMake Projects

* Project names start with the `Esterv` string and follow PascalCase style.

### CMake Targets

* Target names start with capital names following PascalCase style.
* Target are exported in the `Esterv` namespace.

### CMake Components

* CMake component names start with the `Esterv` string and follow PascalCase style.
* CMake component names easily identify a small component of the project or use the `PROJECT_NAME` CMake variable.
* Cmake componets can have suffixes, suffixes that identify the purpose of the component, like `-dev`, `-qml`, `-examples`.

### C++ headers and namespaces

* C++ namespace names start with the root name of `Esterv`. All namespaces follow PascalCase style.
* C++ headers follow snake_case naming style. 
* C++ headers are placed in folders following snake_case style, and the root folder for include is named `esterv`.

### QML Files

* QML file names should follow PascalCase style.

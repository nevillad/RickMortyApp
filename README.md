# Rick and Morty iOS App

This is a sample iOS 13+ UIKit project using:

- [x] [Clean Swift](https://clean-swift.com/)
      - Clean architechture satishfy SOLID principles, It decouple class responsibility wiht well established boundries(More easy to test and suitable TDD), Each class has it's own responsibilities so we can achive sepration of concerns. 
- [x] Cached option with URLCache
     - To avoid unwanted API requests for single day.

## Project Structure
<img width="182" alt="Screenshot 2022-01-07 at 2 36 56 PM" src="https://user-images.githubusercontent.com/3881137/148520027-fc239442-52a9-4c2a-ba14-977a24237d90.png">
- **Configuration** Folder contains xcconfing files which has confinguration based on App and Environment 
- **Models** Folder contains DataModel Classes
- **Services** Folder Network Service related classes
- **Utilities** Folder contails Extetions, Custom Reviews and Utility Classes
- **Scenes** Folder contains all the screens files e.g ViewController, Intractor, Presenter, Router and Model claess for each screen


![Simulator Screen Recording - iPhone 12 - 2022-01-07 at 14 51 52](https://user-images.githubusercontent.com/3881137/148522588-013c0c3e-7614-4d39-a3df-28adf5968a37.gif)

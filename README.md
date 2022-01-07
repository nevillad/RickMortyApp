# Rick and Morty iOS App

This is a sample app developed using UIKit framework and having support of minimum iOS version 13. While developing I have kept clean swift architechture in mind and have listed description below.

- [x] [Clean Swift](https://clean-swift.com/)
      In Clean Swift, your project structure is built around scenes. Here is an example how does one scene looks like. In other words, we will have a set of components for each scene that will "work" for our controller. These are the components<br /> 
      * **Models**<br /> 
      * **Router**<br /> 
      * **Worker**<br /> 
      * **Interactor**<br /> 
      * **Presenter**<br /> <br /> 
      Clean architechture satisfies SOLID principles and it decouple class responsibility with well established boundries(More easy to test and suitable for TDD), Each class has it's own responsibilities and it can be achieved through sepration of concerns using protocols.
      <br />

- [x] Cached option with URLCache
     - To avoid unwanted API requests for single day.
           // Load offline data if available
          - Step 1: Retrive url reponse cached for url request
          - Step 2: Check if url reponse cached is of same day
                   - If data is of same day return clouser with cached data
          - Step 3: if response data found then cache those data
          - Step 4: Return local cache data if error occuered OR data not available

## Project Structure
<img width="182" alt="Screenshot 2022-01-07 at 2 36 56 PM" src="https://user-images.githubusercontent.com/3881137/148520027-fc239442-52a9-4c2a-ba14-977a24237d90.png">

- **Configuration** Folder contains xcconfing files which has confinguration based on App and Environment 
- **Models** Folder contains DataModel Classes
- **Services** Folder Network Service related classes
- **Utilities** Folder contails Extetions, Custom Reviews and Utility Classes
- **Scenes** Folder contains all the screens files e.g ViewController, Intractor, Presenter, Router and Model claess for each screen


App UI Screens


![Simulator Screen Recording - iPhone 12 - 2022-01-07 at 14 51 52](https://user-images.githubusercontent.com/3881137/148522588-013c0c3e-7614-4d39-a3df-28adf5968a37.gif)

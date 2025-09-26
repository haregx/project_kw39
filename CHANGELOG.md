# Changelog

## [2025-09-26]

### Added
- Created a responsive AboutMePage with a circular profile image, name, profession, and a detailed profile description.
- Added a date ("Stand: September 2025") to the AboutMePage.
- Implemented image enlargement: tapping the profile image opens a dialog showing the image at up to 800px with padding.
- Limited the profile content width to a maximum of 600px and centered it horizontally.
- Made the AboutMePage scrollable for long profile descriptions.
- Profile image size adapts to screen height, with increased size for screens taller than 600px.

### Changed
- Updated navigation to use `NavigationBar` instead of `BottomNavigationBar`.
- Improved layout and responsiveness for various screen sizes.

### Fixed
- Resolved layout and syntax issues in AboutMePage.
- Ensured dialogs close when tapping the image or outside the dialog.

---

## Project Folder Structure

```
lib/
  components/        # Reusable UI components (e.g., GalleryItemCard)
  constants/         # Application-wide constants (such as routes)
  data/              # Static data, lists, and sample data
  screens/           # Main app screens (Home, AboutMe, Details, etc.)
  main.dart          # App entry point and main configuration
assets/
  images/            # Image files used in the app (gallery, profile pictures, etc.)
```

**Description:**
- `lib/constants/`: Contains constants like route definitions for navigation.
- `lib/screens/`: Holds the main pages of the app, each as a separate Dart file.
- `lib/models/`: Defines data structures used throughout the app.
- `lib/components/`: Contains reusable UI components for the app.
- `assets/images/`: Stores all image files used in the app.

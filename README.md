# react-native-reference-library-view

## Demo
# ![Demo](https://thumbs.gfycat.com/ScornfulHastyImperialeagle-size_restricted.gif)

## Getting started

`$ npm install react-native-reference-library-view --save`

### Mostly automatic installation

`$ react-native link react-native-reference-library-view`

## Usage
```javascript
import ReferenceLibraryView from 'react-native-reference-library-view'

ReferenceLibraryView.showDefinitionForTerm(word, (hasDefinition) => {
  // Dictionary modal will show regardless of hasDefinition result
  if (!hasDefinition) {
    //callback when no definition available
  } else {
    // callback when definition available
  }
})
```

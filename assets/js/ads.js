// removeClasses.js
function removeClassesUsingRules(classNamesToRemove) {
    classNamesToRemove.forEach(className => {
      const elements = document.querySelectorAll(`.${className}`);
      elements.forEach(element => element.remove());
    });
  }
  
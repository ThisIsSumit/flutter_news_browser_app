console.log("Running custom JavaScript...");
try {
  const textToHighlightList = window.textToHighlightList || [];
  console.log('list ', textToHighlightList);
  const paragraphs = document.querySelectorAll('p');

  // Function to escape special characters for RegExp
  function escapeRegExp(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  }

  paragraphs.forEach(paragraph => {
    let paragraphText = paragraph.innerHTML;

    textToHighlightList.forEach(textToHighlight => {
      const escapedTextToHighlight = escapeRegExp(textToHighlight);
      const regex = new RegExp(escapedTextToHighlight, 'g');
      paragraphText = paragraphText.replace(regex, `<span style="background-color: yellow;">${textToHighlight}</span>`);
    });

    paragraph.innerHTML = paragraphText;
  });

  console.log("Custom JavaScript executed successfully.");
} catch (error) {
  console.error("Error executing custom JavaScript:", error);
}

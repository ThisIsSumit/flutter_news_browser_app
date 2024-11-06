console.log("runjs");

function modifyPage() {
  try {
    const header = document.querySelector('header');
    const footer = document.querySelector('footer');
    const container = document.getElementById("containerMain");
    const bottomMenu = document.querySelector('.bottomMenu'); // Selects the first element with the class 'bottom-menu'
    const adds = document.querySelector('.adHeight313');
    // Log the values of header, footer, and bottomMenu
    console.log('Header:', header);
    console.log('Footer:', footer);
    console.log('Bottom Menu:', bottomMenu);

    let removed = 0;

    if (header) {
      header.remove();
      removed++;
    }

    if (footer) {
      footer.remove();
      removed++;
    }

    if (bottomMenu) {
      bottomMenu.remove();
      removed++;
    }
    if (adds) {
     adds.remove();
      removed++;
    }
    
    if (container) {
      container.style.marginTop = "0";
    }

    // Remove ad elements by commonly used classes and IDs
    // const adSelectors = [
    //   '.ad', '.ads', '#ad', '#advertisement', '[id*="ad"]', '[class*="ad"]',
    //   '.sponsored', '.promo', '[class*="sponsor"]', '[id*="sponsor"]'
    // ];

    // adSelectors.forEach(selector => {
    //   document.querySelectorAll(selector).forEach(ad => {
    //     console.log('Removing ad element:', ad);
    //     ad.remove();
    //     removed++;
    //   });
    // });

    return {
      success: true,
      removed: removed,
      containerAdjusted: !!container
    };
  } catch (error) {
    return {
      success: false,
      error: error.toString()
    };
  }
}

// Call the function and log the result to the console
console.log(modifyPage());

describe('Jungle homepage', () => {
    beforeEach(() => {
      // Cypress starts out with a blank slate for each test
      // so we must tell it to visit our website with the `cy.visit()` command.
      // Since we want to visit the same URL at the start of all our tests,
      // we include it in our beforeEach function so that it runs before each test
      cy.visit('http://localhost:3000/')
    })

    it('users can click the "Add to Cart" button for a product on the home page and in doing so their cart increases by one', () => {
        // Store the initial cart count
        cy.get('.nav-item.end-0').contains('.nav-link', 'My Cart').invoke('text').then((initialCartCount) => {
        const cartCount = parseInt(initialCartCount.match(/\d+/)[0]);
  
        // Click the 'Add to Cart' button for a product
        cy.get('.products-index article')
          .eq(0) // Adjust the index to select the desired product
          .contains('.btn', 'Add')
          .click({ force: true });
  
        // Verify that the cart count has increased
        cy.get('.nav-item.end-0').contains('.nav-link', 'My Cart').should('contain', `My Cart (${cartCount + 1})`);
      });
    })
})
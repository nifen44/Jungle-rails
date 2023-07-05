describe('Jungle homepage', () => {
    beforeEach(() => {
      // Cypress starts out with a blank slate for each test
      // so we must tell it to visit our website with the `cy.visit()` command.
      // Since we want to visit the same URL at the start of all our tests,
      // we include it in our beforeEach function so that it runs before each test
      cy.visit('http://localhost:3000/')
    })

    it('User can navigate to product detail page', () => {
        // Find the product link on the home page and click it
        cy.get('.products-index')
          .find('article') 
          .find('a') 
          .eq(0)
          .click();
      
        // Assert that the current URL contains the product detail path
        cy.url().should('include', '/products/1'); 
      });

})
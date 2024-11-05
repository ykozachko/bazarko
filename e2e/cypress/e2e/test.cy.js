describe("TEST", function () {
  beforeEach(() => {
    cy.app("clean"); // have a look at e2e/app_commands/clean.rb

    cy.appFactories([["create", "user", { email: "user@example.com", password: "123123" }]]);
  });

  it("TEST", function () {
    // cy.visit("/");
    cy.visit("/users/sign_in");
    cy.get("#user_email").type("user@example.com");
    cy.get("#user_password").type("123123");
    cy.contains("Prihlásiť sa").click();
  });
});

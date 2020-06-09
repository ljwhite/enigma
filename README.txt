Self-Evaluation

Functionality: Meets Expectations 3/4
Enigma Class - contains functional encrypt and decrypt methods.
CLI - functionally encrypts messages from .txt files, as specified in the docs.

OOP: Meets Expectations 3/4
The Enigma Class is supported by methods in the Encryption module.
The single responsibility of the Enigma class is to run the encrypt and decrypt methods.

The Encryption module contains all the helper methods needed to assist the Enigma class.
I considered splitting up Encryption into separate Encryption and Decryption modules, but decided not to for two reasons.
1) Only two methods differed from Encryption to Decryption. There is enough overlap that I didn't see a sufficient reason to split it up.
2) The Encryption module is 75 lines long. It's not long enough to justify a split.

The Encrypt and Decrypt runner files are supported by methods in the Encryption module.
The Runner files are decoupled from the Enigma class, as all required methods are traced back to the module.

Ruby Conventions and Mechanics: Meets Expectations 3/4
Code is properly spaced, and naming conventions are followed throughout the project.
Nested iterations have been avoided where possible.
Hash has been implemented.

TDD: Meets Expectations 3/4
Every method is tested at both the unit and integration level.
Edge cases are addressed.
Git history shows that testing preceded code writing, outside of the runner files.
Stubs are used to address randomization.

Version Control. Meets Expectations 3/4
Most commits include logical chunks of functionality. There are an adequate number of commits to meet expectation.
Documentation clearly indicates commit functionality and the purpose of the pull request.

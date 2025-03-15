This repository contains my personal SaltStack infrastructure states. 

The provided configuration states can be executed on a Salt master without requiring root or sudo privileges. However, the limitation of this root-less approach is that every command must be executed from the project root directory.

You must adapt the Saltfile, master and pillar data to your specific environment and requirements. The default pillar data provided in this repository is GPG-encrypted, so if you do not modify the pillars accordingly, applying states will not work.


Important Notice:
It is critical that you review and fully understand the contents of this repository before deploying any states. Blindly copying configurations without proper understanding could, and will, lead to unintended consequences.

If you encounter any issues, have questions, or require further clarification, please feel free to contact me.

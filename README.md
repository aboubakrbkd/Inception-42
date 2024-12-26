# Inception-42

A Brief Story About Virtualization:

In the early days, back in the 1960s, each application had its own dedicated server. If a company wanted to develop another application, it needed to scale the servers either vertically or horizontally, which was very expensive. This led to the idea of the virtual machine (VM)—essentially, a "machine inside a machine" that was isolated from others.

The VM was a great innovation and solved many issues. However, over time, applications became more complex, requiring numerous dependencies. Each virtual machine needed its own hardware resources and operating system for deployment or testing. This created what is known as VM tax—a significant inefficiency where resources were wasted because every virtual machine required its own hardware and OS, even when only the application was needed.

An operating system has two primary layers:

Kernel mode – Responsible for managing the system's hardware and critical processes.
User mode – Where user applications and interfaces operate.
For most applications, the user mode of the OS isn't essential, but the kernel layer is crucial. This led engineers to ask: "What if we could use the main OS server's kernel layer to eliminate these inefficiencies?"

This idea gave rise to containers. Containers allow applications to share the underlying OS kernel, drastically reducing resource usage while keeping applications isolated.

So, how did we solve this problem? That’s where containers came into the picture.
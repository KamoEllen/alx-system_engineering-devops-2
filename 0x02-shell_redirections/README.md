To list all files/directories in the current working directory and all sub-directories, and explore the use of quotations in piping commands:

1. **List All Files/Dirs in Current and Sub-Directories:**
   ```
   ls -laR
   ```

2. **Attempt 1 (With Quotations):**
   ```
   ls -laR . | find -name '*.js' -type 'f' | wc -l
   ```
   - Output: 4

3. **Attempt 2 (Without Quotations):**
   ```
   ls -laR | find -name *.js -type f | wc -l
   ```
   - Output: Error due to missing quotations around '*.js'

4. **Simplified Command (No `ls`):**
   ```
   find -name '*.js' -type f | wc -l
   ```
   - Output: 4

In summary, using quotations around '*.js' is necessary when piping commands to `find` to avoid errors with patterns containing special characters. In the case of `wc -l` returning 10 results while the script counts 9, further investigation is needed to reconcile the discrepancy.
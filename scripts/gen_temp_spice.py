def replace_text_in_file(file_path, new_file_path, old_text1, new_text1, old_text2, new_text2):
    with open(file_path, 'r') as file:
        content = file.read()
        modified_content = content.replace(old_text1, new_text1).replace(old_text2, new_text2)

    with open(new_file_path, 'w') as new_file:
        new_file.write(modified_content)

# Usage
if __name__ == "__main__":
    # Specify the file paths and texts
    file_path = 'test_SDCtsens_RINtsweep_9p1_ROrangeext.spice'
    old_text1 = 'tm40'
    new_text1_tm40 = 'tm40'
    old_text2 = '.option temp = -40'
    new_text2_tm40 = '.option temp = -40'
    file_tm40 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_tm40.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_tm40, old_text1, new_text1_tm40, old_text2, new_text2_tm40)
    print(f"Text replaced and saved in {file_tm40}.")
    
    new_text1_tm25 = 'tm25'
    new_text2_tm25 = '.option temp = -25'
    file_tm25 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_tm25.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_tm25, old_text1, new_text1_tm25, old_text2, new_text2_tm25)
    print(f"Text replaced and saved in {file_tm25}.")
    
    new_text1_tm10 = 'tm10'
    new_text2_tm10 = '.option temp = -10'
    file_tm10 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_tm10.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_tm10, old_text1, new_text1_tm10, old_text2, new_text2_tm10)
    print(f"Text replaced and saved in {file_tm10}.")
    
    new_text1_t5 = 't5'
    new_text2_t5 = '.option temp = 5'
    file_t5 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t5.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t5, old_text1, new_text1_t5, old_text2, new_text2_t5)
    print(f"Text replaced and saved in {file_t5}.")
    
    new_text1_t20 = 't20'
    new_text2_t20 = '.option temp = 20'
    file_t20 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t20.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t20, old_text1, new_text1_t20, old_text2, new_text2_t20)
    print(f"Text replaced and saved in {file_t20}.")
    
    new_text1_t35 = 't35'
    new_text2_t35 = '.option temp = 35'
    file_t35 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t35.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t35, old_text1, new_text1_t35, old_text2, new_text2_t35)
    print(f"Text replaced and saved in {file_t35}.")
    
    new_text1_t50 = 't50'
    new_text2_t50 = '.option temp = 50'
    file_t50 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t50.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t50, old_text1, new_text1_t50, old_text2, new_text2_t50)
    print(f"Text replaced and saved in {file_t50}.")
    
    new_text1_t65 = 't65'
    new_text2_t65 = '.option temp = 65'
    file_t65 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t65.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t65, old_text1, new_text1_t65, old_text2, new_text2_t65)
    print(f"Text replaced and saved in {file_t65}.")
    
    new_text1_t80 = 't80'
    new_text2_t80 = '.option temp = 80'
    file_t80 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t80.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t80, old_text1, new_text1_t80, old_text2, new_text2_t80)
    print(f"Text replaced and saved in {file_t80}.")
    
    new_text1_t95 = 't95'
    new_text2_t95 = '.option temp = 95'
    file_t95 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t95.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t95, old_text1, new_text1_t95, old_text2, new_text2_t95)
    print(f"Text replaced and saved in {file_t95}.")
    
    new_text1_t110 = 't110'
    new_text2_t110 = '.option temp = 110'
    file_t110 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t110.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t110, old_text1, new_text1_t110, old_text2, new_text2_t110)
    print(f"Text replaced and saved in {file_t110}.")
    
    new_text1_t125 = 't125'
    new_text2_t125 = '.option temp = 125'
    file_t125 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t125.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t125, old_text1, new_text1_t125, old_text2, new_text2_t125)
    print(f"Text replaced and saved in {file_t125}.")
    
    new_text1_t140 = 't140'
    new_text2_t140 = '.option temp = 140'
    file_t140 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t140.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t140, old_text1, new_text1_t140, old_text2, new_text2_t140)
    print(f"Text replaced and saved in {file_t140}.")
    
    new_text1_t155 = 't155'
    new_text2_t155 = '.option temp = 155'
    file_t155 = 'test_SDCtsens_RINtsweep_9p1_ROrangeext_t155.spice'
    # Call the function to replace text in the file
    replace_text_in_file(file_path, file_t155, old_text1, new_text1_t155, old_text2, new_text2_t155)
    print(f"Text replaced and saved in {file_t155}.")

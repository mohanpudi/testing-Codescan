/**************************************************************************************************
Name : UserDeactivationBatchSchedulable
Description : This batch class created to schedule deactivating users on daily basis.
Author : Mohan Pudi
***************************************************************************************************/
global class UserDeactivationBatchSchedulable implements Schedulable{
 /*
   * This method schedule batch class at specified time
   */
   global void execute(SchedulableContext schedulableContext){
        // The query string passed while batch is executed.
        //String proId='00eA0000000sfk4IAA';
        //String usId='00EA0000000MB4hMAG';

        String queryString='';
        queryString='SELECT Name, Id, IsActive FROM User WHERE profileId!=:proId AND UserRoleId!=:usId AND IsActive = true';    
        UserDeactivationBatch deactivateUsersObj = new UserDeactivationBatch(queryString); 
        database.executebatch(deactivateUsersObj);

   }
}
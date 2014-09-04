
public class Milestone1_TaskTriggerDispatcher extends TriggerDispatcherBase {
	private static Boolean isBeforeInsertProcessing = false;
	private static Boolean isBeforeUpdateProcessing = false;
	private static Boolean isAfterInsertProcessing = false;
	private static Boolean isAfterUpdateProcessing = false; 
	private static Boolean isBeforeDeleteProcessing = false;
	private static Boolean isAfterDeleteProcessing = false; 
	
	/** 
	* @description Called by the trigger framework to carry out the actions before the records are inserted. If there is an
	*				existing call running on the same context, the rentrant call will utilize the handler that was created
	*				in the original call.
	* @param TriggerParameters Contains the trigger parameters which includes the records that is getting inserted.
	*/
	public virtual override void beforeInsert(TriggerParameters tp) {
		if(!isBeforeInsertProcessing) {
			isBeforeInsertProcessing = true;
			execute(new Milestones1_TaskBeforeInsertTrigger(), tp, TriggerParameters.TriggerEvent.beforeInsert);
			isBeforeInsertProcessing = false;
		}
		else execute(null, tp, TriggerParameters.TriggerEvent.beforeInsert);
	}
	
	/** 
	* @author Hari Krishnan
	* @date 06/20/2013
	* @description Called by the trigger framework to carry out the actions before the records are updated. If there is an
	*				existing call running on the same context, the rentrant call will utilize the handler that was created
	*				in the original call.
	* @param TriggerParameters Contains the trigger parameters which includes the records that is getting updated.
	*/
	public virtual override void beforeUpdate(TriggerParameters tp) {
		if(!isBeforeUpdateProcessing) {
			isBeforeUpdateProcessing = true;
			execute(new Milestones1_TaskBeforeUpdateTrigger(), tp, TriggerParameters.TriggerEvent.beforeUpdate);
			isBeforeUpdateProcessing = false;
		}
		else execute(null, tp, TriggerParameters.TriggerEvent.beforeUpdate);
	}

	/** 
	* @author Hari Krishnan
	* @date 07/17/2013
	* @description Called by the trigger framework to carry out the actions after the record(s) are created. If there is an
	*				existing call running on the same context, the rentrant call will utilize the handler that was created
	*				in the original call.
	* @param TriggerParameters Contains the trigger parameters which includes the record(s) that got created.
	*/
	public virtual override void afterInsert(TriggerParameters tp) {
		if(!isAfterInsertProcessing) {
			isAfterInsertProcessing = true;
			execute(new Milestones1_TaskAfterInsertTrigger(), tp, TriggerParameters.TriggerEvent.afterInsert);
			isAfterInsertProcessing = false;
		}
		else execute(null, tp, TriggerParameters.TriggerEvent.afterInsert);
	}

	/** 
	* @author Hari Krishnan
	* @date 07/17/2013
	* @description Called by the trigger framework to carry out the actions after the records are updated. If there is an
	*				existing call running on the same context, the rentrant call will utilize the handler that was created
	*				in the original call.
	* @param TriggerParameters Contains the trigger parameters which includes the record(s) that got updated.
	*/	
	public virtual override void afterUpdate(TriggerParameters tp) {
		if(!isAfterUpdateProcessing) {
			isAfterUpdateProcessing = true;
			execute(new Milestones1_TaskAfterUpdateTrigger(), tp, TriggerParameters.TriggerEvent.afterUpdate);
			isAfterUpdateProcessing = false;
		}
		else execute(null, tp, TriggerParameters.TriggerEvent.afterUpdate);
	}
	public virtual override void beforeDelete(TriggerParameters tp) {
		if(!isBeforeDeleteProcessing) {
			isBeforeDeleteProcessing = true;
			execute(new Milestones1_MilestoneBeforeDeleteTrigger(), tp, TriggerParameters.TriggerEvent.BeforeDelete);
			isBeforeDeleteProcessing = false;
		}
		else execute(null, tp, TriggerParameters.TriggerEvent.BeforeDelete);
	}
	public virtual override void AfterDelete(TriggerParameters tp) {
		if(!isAfterDeleteProcessing) {
			isAfterDeleteProcessing = true;
			execute(new Milestones1_MilestoneAfterDeleteTrigger(), tp, TriggerParameters.TriggerEvent.AfterDelete);
			isafterDeleteProcessing = false;
		}
		else execute(null, tp, TriggerParameters.TriggerEvent.AfterDelete);
	}
}
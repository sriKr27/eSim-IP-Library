/* This is cfunc.mod file auto generated by gen_con_info.py
        Developed by Sumanto Kar at IIT Bombay */

                
        #include <stdio.h>
        #include <math.h>
        #include <string.h>
        #include "sim_main_buf12.h"

        
void cm_buf12(ARGS) 
{
	Digital_State_t *_op_y, *_op_y_old;
	Digital_State_t *_op_ybar, *_op_ybar_old;

    static int inst_count=0;
    int count=0;
        
    if(INIT)
    {
        inst_count++;
        PARAM(instance_id)=inst_count;
        foobuf12(0,inst_count);
        /* Allocate storage for output ports and set the load for input ports */

        
        port_a=PORT_SIZE(a);

        port_y=PORT_SIZE(y);

        port_ybar=PORT_SIZE(ybar);
		cm_event_alloc(0,1*sizeof(Digital_State_t));
		cm_event_alloc(1,1*sizeof(Digital_State_t));
		/* set the load for input ports. */
		int Ii;
		for(Ii=0;Ii<PORT_SIZE(a);Ii++)
		{
			LOAD(a[Ii])=PARAM(input_load); 
		}

		/*Retrieve Storage for output*/
		_op_y = _op_y_old = (Digital_State_t *) cm_event_get_ptr(0,0);
		_op_ybar = _op_ybar_old = (Digital_State_t *) cm_event_get_ptr(1,0);


	}
	else
	{
		_op_y = (Digital_State_t *) cm_event_get_ptr(0,0);
		_op_y_old = (Digital_State_t *) cm_event_get_ptr(0,1);
		_op_ybar = (Digital_State_t *) cm_event_get_ptr(1,1);
		_op_ybar_old = (Digital_State_t *) cm_event_get_ptr(1,2);
	}

	//Formating data for sending it to client
	int Ii;
	count=(int)PARAM(instance_id);

    for(Ii=0;Ii<PORT_SIZE(a);Ii++)
    {
        if( INPUT_STATE(a[Ii])==ZERO )
        {
            temp_a[Ii]=0;            }
        else
        {
            temp_a[Ii]=1;
        }
            }
	foobuf12(1,count);

	/* Scheduling event and processing them */
    for(Ii=0;Ii<PORT_SIZE(y);Ii++)
    {
        if(temp_y[Ii]==0)
        {
            _op_y[Ii]=ZERO;
            }
        else if(temp_y[Ii]==1)
        {
            _op_y[Ii]=ONE;
            }
        else
        {
            printf("Unknown value\n");
                }

        if(ANALYSIS == DC)
        {
            OUTPUT_STATE(y[Ii]) = _op_y[Ii];
            }
        else if(_op_y[Ii] != _op_y_old[Ii])
        {
            OUTPUT_STATE(y[Ii]) = _op_y[Ii];
            OUTPUT_DELAY(y[Ii]) = ((_op_y[Ii] == ZERO) ? PARAM(fall_delay) : PARAM(rise_delay));
            }
        else
        {
            OUTPUT_CHANGED(y[Ii]) = FALSE;
            }
        OUTPUT_STRENGTH(y[Ii]) = STRONG;
    }
	/* Scheduling event and processing them */
    for(Ii=0;Ii<PORT_SIZE(ybar);Ii++)
    {
        if(temp_ybar[Ii]==0)
        {
            _op_ybar[Ii]=ZERO;
            }
        else if(temp_ybar[Ii]==1)
        {
            _op_ybar[Ii]=ONE;
            }
        else
        {
            printf("Unknown value\n");
                }

        if(ANALYSIS == DC)
        {
            OUTPUT_STATE(ybar[Ii]) = _op_ybar[Ii];
            }
        else if(_op_ybar[Ii] != _op_ybar_old[Ii])
        {
            OUTPUT_STATE(ybar[Ii]) = _op_ybar[Ii];
            OUTPUT_DELAY(ybar[Ii]) = ((_op_ybar[Ii] == ZERO) ? PARAM(fall_delay) : PARAM(rise_delay));
            }
        else
        {
            OUTPUT_CHANGED(ybar[Ii]) = FALSE;
            }
        OUTPUT_STRENGTH(ybar[Ii]) = STRONG;
    }

}
/* This is cfunc.mod file auto generated by gen_con_info.py
        Developed by Sumanto Kar at IIT Bombay */

                
        #include <stdio.h>
        #include <math.h>
        #include <string.h>
        #include "sim_main_inv11.h"

        
void cm_inv11(ARGS) 
{
	Digital_State_t *_op_inv_out, *_op_inv_out_old;

    static int inst_count=0;
    int count=0;
        
    if(INIT)
    {
        inst_count++;
        PARAM(instance_id)=inst_count;
        fooinv11(0,inst_count);
        /* Allocate storage for output ports and set the load for input ports */

        
        port_inv_in=PORT_SIZE(inv_in);

        port_inv_out=PORT_SIZE(inv_out);
		cm_event_alloc(0,1*sizeof(Digital_State_t));
		/* set the load for input ports. */
		int Ii;
		for(Ii=0;Ii<PORT_SIZE(inv_in);Ii++)
		{
			LOAD(inv_in[Ii])=PARAM(input_load); 
		}

		/*Retrieve Storage for output*/
		_op_inv_out = _op_inv_out_old = (Digital_State_t *) cm_event_get_ptr(0,0);


	}
	else
	{
		_op_inv_out = (Digital_State_t *) cm_event_get_ptr(0,0);
		_op_inv_out_old = (Digital_State_t *) cm_event_get_ptr(0,1);
	}

	//Formating data for sending it to client
	int Ii;
	count=(int)PARAM(instance_id);

    for(Ii=0;Ii<PORT_SIZE(inv_in);Ii++)
    {
        if( INPUT_STATE(inv_in[Ii])==ZERO )
        {
            temp_inv_in[Ii]=0;            }
        else
        {
            temp_inv_in[Ii]=1;
        }
            }
	fooinv11(1,count);

	/* Scheduling event and processing them */
    for(Ii=0;Ii<PORT_SIZE(inv_out);Ii++)
    {
        if(temp_inv_out[Ii]==0)
        {
            _op_inv_out[Ii]=ZERO;
            }
        else if(temp_inv_out[Ii]==1)
        {
            _op_inv_out[Ii]=ONE;
            }
        else
        {
            printf("Unknown value\n");
                }

        if(ANALYSIS == DC)
        {
            OUTPUT_STATE(inv_out[Ii]) = _op_inv_out[Ii];
            }
        else if(_op_inv_out[Ii] != _op_inv_out_old[Ii])
        {
            OUTPUT_STATE(inv_out[Ii]) = _op_inv_out[Ii];
            OUTPUT_DELAY(inv_out[Ii]) = ((_op_inv_out[Ii] == ZERO) ? PARAM(fall_delay) : PARAM(rise_delay));
            }
        else
        {
            OUTPUT_CHANGED(inv_out[Ii]) = FALSE;
            }
        OUTPUT_STRENGTH(inv_out[Ii]) = STRONG;
    }

}
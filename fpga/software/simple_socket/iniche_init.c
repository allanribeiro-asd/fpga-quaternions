/******************************************************************************
* Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
*******************************************************************************                                                                             *
* Date - October 24, 2006                                                     *
* Module - iniche_init.c                                                      *
*                                                                             *                                                                             *
******************************************************************************/

/******************************************************************************
 * NicheStack TCP/IP stack initialization and Operating System Start in main()
 * for Simple Socket Server (SSS) example. 
 * 
 * This example demonstrates the use of MicroC/OS-II running on NIOS II.       
 * In addition it is to serve as a good starting point for designs using       
 * MicroC/OS-II and Altera NicheStack TCP/IP Stack - NIOS II Edition.                                                                                           
 *      
 * Please refer to the Altera NicheStack Tutorial documentation for details on 
 * this software example, as well as details on how to configure the NicheStack
 * TCP/IP networking stack and MicroC/OS-II Real-Time Operating System.  
 */
  
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <io.h>
#include <fcntl.h>
/* MicroC/OS-II definitions */
#include "../simple_socket_bsp/HAL/inc/includes.h"

#include "../simple_socket_bsp/system.h"

#include "dm9000a.h"

/* Simple Socket Server definitions */
#include "simple_socket_server.h"
#include "alt_error_handler.h"

/* Nichestack definitions */
#include "../simple_socket_bsp/iniche/src/h/nios2/ipport.h"
#include "../simple_socket_bsp/iniche/src/h/tcpport.h"
#include "../simple_socket_bsp/iniche/src/h/libport.h"
#include "../simple_socket_bsp/iniche/src/nios2/osport.h"
#include "basic_io.h"
#include "LCD.h"
#include "altera_avalon_pio_regs.h"
/* Definition of task stack for the initial task which will initialize the NicheStack
 * TCP/IP Stack and then initialize the rest of the Simple Socket Server example tasks. 
 */
OS_STK    SSSInitialTaskStk[TASK_STACKSIZE];

/* Declarations for creating a task with TK_NEWTASK.  
 * All tasks which use NicheStack (those that use sockets) must be created this way.
 * TK_OBJECT macro creates the static task object used by NicheStack during operation.
 * TK_ENTRY macro corresponds to the entry point, or defined function name, of the task.
 * inet_taskinfo is the structure used by TK_NEWTASK to create the task.
 */
TK_OBJECT(to_ssstask);
TK_ENTRY(SSSSimpleSocketServerTask);

struct inet_taskinfo ssstask = {
      &to_ssstask,
      "simple socket server",
      SSSSimpleSocketServerTask,
      4,
      APP_STACK_SIZE,
};

/* SSSInitialTask will initialize the NicheStack
 * TCP/IP Stack and then initialize the rest of the Simple Socket Server example 
 * RTOS structures and tasks. 
 */
void SSSInitialTask(void *task_data)
{
	INT8U error_code;
	
	/*
	 * Initialize Altera NicheStack TCP/IP Stack - Nios II Edition specific code.
	 * NicheStack is initialized from a task, so that RTOS will have started, and 
	 * I/O drivers are available.	Two tasks are created:
	 *		"Inet main"	task with priority 2
	 *		"clock tick" task with priority 3
	 */	 
	alt_iniche_init();
	netmain(); 

	/* Wait for the network stack to be ready before proceeding. 
	 * iniche_net_ready indicates that TCP/IP stack is ready, and IP address is obtained.
	 */
	while (!iniche_net_ready)
		TK_SLEEP(1);

	/* Now that the stack is running, perform the application initialization steps */
	
	/* Application Specific Task Launching Code Block Begin */

	printf("\nSimple Socket Server starting up\n");

	LC_Init();
	
	// Abrir socket
	sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	struct sockaddr_in sa;
	memset(&sa, 0, sizeof sa);
	sa.sin_family = AF_INET;
	sa.sin_port = htons(666); // ALTERAR PORTA A SER UTILIZADA AQUI
	res = inet_pton(AF_INET, "192.168.1.110", &sa.sin_addr); //ALTERAR O IP DO SERVIDOR AQUI
	if (connect(sock, (struct sockaddr *)&sa, sizeof sa) == -1)
	{
		perror("connect failed");
		close(sock);
		exit(EXIT_FAILURE);
	}

	//importar arquivo de coordenadas

	// Entrada
	// Pior caso: 80 chars
	//	"Time (s)","Gyroscope x (rad/s)","Gyroscope y (rad/s)","Gyroscope z (rad/s)"
	//	-1.004321940E-1,-2.769000130E-3,-7.490001153E-4,-2.243000083E-3,-3.641347589E-3\n
	char buffer[80];
	
	while (1)
	{
		recv(sock, buffer, sizeof(buffer), 0) < 0) LCD_Show_Text("Conection error quat1");
		{LCD_Line2(); LCD_Show_Text(buffer);}
	
		// Recepção primeiro quaternion
		if (recv(sock, buffer, sizeof(buffer), 0) < 0) LCD_Show_Text("Conection error quat0");
		for (int data = 0; data < 4; data++)
			quaternion[0][data] = parse(buffer, data);
		// Escrita na memória
		IOWR(REG00, 0, quaternion[0][0]); // Tempo
		IOWR(REG01, 0, quaternion[0][1]); // Eixo X
		IOWR(REG02, 0, quaternion[0][2]); // Eixo Y
		IOWR(REG03, 0, quaternion[0][3]); // Eixo Z

		// Recepção segundo quaternion
		if (recv(sock, buffer, sizeof(buffer), 0) < 0) LCD_Show_Text("Conection error quat1");
		for (int data = 0; data < 4; data++)
			quaternion[1][data] = parse(buffer, data);
		// Escrita na memória
		IOWR(REG10, 1, quaternion[1][0]); // Tempo
		IOWR(REG11, 1, quaternion[1][1]); // Eixo X
		IOWR(REG12, 1, quaternion[1][2]); // Eixo Y
		IOWR(REG13, 1, quaternion[1][3]); // Eixo Z

		// Descobrir como evitar ms
		msleep(100);

		quaternion[2][0] = IOWR(REG10, 2); // Tempo
		quaternion[2][0] = IOWR(REG10, 2); // Eixo X
		quaternion[2][0] = IOWR(REG10, 2); // Eixo Y
		quaternion[2][0] = IOWR(REG10, 2); // Eixo Z

		buffer = unparse(quaternion[2]);
		if (send(sock, buffer, sizeof(buffer), 0) < 0) LCD_Show_Text("Conection error quat2");
	}
}

/* Main creates a single task, SSSInitialTask, and starts task scheduler.
 */

int main (int argc, char* argv[], char* envp[])
{
  
  INT8U error_code;

  DM9000A_INSTANCE( DM9000A_0, dm9000a_0 );
  DM9000A_INIT( DM9000A_0, dm9000a_0 );

  /* Clear the RTOS timer */
  OSTimeSet(0);

  /* SSSInitialTask will initialize the NicheStack
   * TCP/IP Stack and then initialize the rest of the Simple Socket Server example
   * RTOS structures and tasks.
   */
  error_code = OSTaskCreateExt(SSSInitialTask,
                             NULL,
                             (void *)&SSSInitialTaskStk[TASK_STACKSIZE],
                             SSS_INITIAL_TASK_PRIORITY,
                             SSS_INITIAL_TASK_PRIORITY,
                             SSSInitialTaskStk,
                             TASK_STACKSIZE,
                             NULL,
                             0);
  alt_uCOSIIErrorHandler(error_code, 0);

  /*
   * As with all MicroC/OS-II designs, once the initial thread(s) and
   * associated RTOS resources are declared, we start the RTOS. That's it!
   */
  OSStart();
  
  while(1); /* Correct Program Flow never gets here. */

  return -1;
}

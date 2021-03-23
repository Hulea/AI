# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util
#import layout

global x
global y
global vec


x=-1
y=-1
vec=[]
check=0


class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()


def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

def depthFirstSearch(problem):
    """
    Search the deepest nodes in the search tree first.

    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.

    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:

    print "Start:", problem.getStartState()
    print "Is the start a goal?", problem.isGoalState(problem.getStartState())
    print "Start's successors:", problem.getSuccessors(problem.getStartState())
    """
    "*** YOUR CODE HERE ***"
    util.raiseNotDefined()



def taxi(problem):
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    n = Directions.NORTH
    e = Directions.EAST
    solution=[]
    f = open("sas.txt","r")
    #f=open("sas1.txt","r")
    lines = f.readlines()
    i=0
    for i in range(len(lines)):
        if(lines[i].find("move")!=-1):
            if(lines[i].find("strada_patru")!=-1 and lines[i].find("intersectia_7")!=-1 and (lines[i].find("strada_patru") < lines[i].find("intersectia_7"))):
                solution+=[n,n]
            elif (lines[i].find("strada_patru") != -1 and lines[i].find("intersectia_3") != -1 and ( lines[i].find("strada_patru") < lines[i].find("intersectia_3"))):
                solution += [s, s]
               
            elif(lines[i].find("intersectia_7")!=-1 and lines[i].find("strada_trei")!=-1 and (lines[i].find("intersectia_7") < lines[i].find("strada_trei"))):
                solution+=[e,e]
            elif (lines[i].find("intersectia_7") != -1 and lines[i].find("strada_patru") != -1 and ( lines[i].find("intersectia_7") < lines[i].find("strada_patru"))):
                solution += [s, s]
            elif (lines[i].find("intersectia_7") != -1 and lines[i].find("strada_opt") != -1 and ( lines[i].find("intersectia_7") < lines[i].find("strada_opt"))):
                solution += [n, n]
            elif (lines[i].find("intersectia_7") != -1 and lines[i].find("strada_sapte") != -1 and ( lines[i].find("intersectia_7") < lines[i].find("strada_sapte"))):
                solution += [w, w]
           
            elif (lines[i].find("intersectia_2") != -1 and lines[i].find("strada_doi") != -1 and (lines[i].find("intersectia_2") < lines[i].find("strada_doi"))):
                solution += [n,n]
            elif (lines[i].find("intersectia_2") != -1 and lines[i].find("strada_trei") != -1 and (lines[i].find("intersectia_2") < lines[i].find("strada_trei"))):
                solution += [w,w]
               
            elif (lines[i].find("strada_doi") != -1 and lines[i].find("intersectia_1") != -1 and (lines[i].find("strada_doi") < lines[i].find("intersectia_1"))):
                solution += [n,n]
            elif (lines[i].find("strada_doi") != -1 and lines[i].find("intersectia_2") != -1 and (lines[i].find("strada_doi") < lines[i].find("intersectia_2"))):
                solution += [s,s]    
           
            elif (lines[i].find("intersectia_1") != -1 and lines[i].find("strada_doi") != -1 and (lines[i].find("intersectia_1") < lines[i].find("strada_doi"))):
                solution += [s,s]
            elif (lines[i].find("intersectia_1") != -1 and lines[i].find("strada_sase") != -1 and (lines[i].find("intersectia_1") < lines[i].find("strada_sase"))):
                solution += [w,w]
 
            elif (lines[i].find("strada_trei") != -1 and lines[i].find("intersectia_7") != -1 and (lines[i].find("strada_trei") < lines[i].find("intersectia_7"))):
                solution += [w,w]
            elif (lines[i].find("strada_trei") != -1 and lines[i].find("intersectia_2") != -1 and (lines[i].find("strada_trei") < lines[i].find("intersectia_2"))):
                solution+=[e,e]    
               
 
            elif (lines[i].find("intersectia_3") != -1 and lines[i].find("strada_cinci") != -1 and ( lines[i].find("intersectia_3") < lines[i].find("strada_cinci"))):
                solution += [w, w]
            elif (lines[i].find("intersectia_3") != -1 and lines[i].find("strada_patru") != -1 and ( lines[i].find("intersectia_3") < lines[i].find("strada_patru"))):
                solution += [n, n]
 
            elif (lines[i].find("intersectia_5") != -1 and lines[i].find("strada_sapte") != -1 and ( lines[i].find("intersectia_5") < lines[i].find("strada_sapte"))):
                solution += [e, e]
            elif (lines[i].find("intersectia_5") != -1 and lines[i].find("strada_sase") != -1 and ( lines[i].find("intersectia_5") < lines[i].find("strada_sase"))):
                solution += [s, s]
           
           
            elif (lines[i].find("intersectia_6") != -1 and lines[i].find("strada_unu") != -1 and ( lines[i].find("intersectia_6") < lines[i].find("strada_unu"))):
                solution += [e, e]
            elif (lines[i].find("intersectia_6") != -1 and lines[i].find("strada_opt") != -1 and ( lines[i].find("intersectia_6") < lines[i].find("strada_opt"))):
                solution += [s, s]
           
            elif (lines[i].find("strada_cinci") != -1 and lines[i].find("intersectia_3") != -1 and ( lines[i].find("strada_cinci") < lines[i].find("intersectia_3"))):
                solution += [e, e]
            elif (lines[i].find("strada_cinci") != -1 and lines[i].find("intersectia_4") != -1 and ( lines[i].find("strada_cinci") < lines[i].find("intersectia_4"))):
                solution += [w, w]    
               
            elif (lines[i].find("intersectia_4") != -1 and lines[i].find("strada_sase") != -1 and ( lines[i].find("intersectia_4") < lines[i].find("strada_sase"))):
                solution += [n, n]
            elif (lines[i].find("intersectia_4") != -1 and lines[i].find("strada_cinci") != -1 and ( lines[i].find("intersectia_4") < lines[i].find("strada_cinci"))):
                solution += [e, e]
               
               
            elif (lines[i].find("strada_unu") != -1 and lines[i].find("intersectia_6") != -1 and ( lines[i].find("strada_unu") < lines[i].find("intersectia_6"))):
                solution += [w, w]
            elif (lines[i].find("strada_unu") != -1 and lines[i].find("intersectia_1") != -1 and ( lines[i].find("strada_unu") < lines[i].find("intersectia_1"))):
                solution += [e, e]
               
            elif (lines[i].find("strada_sase") != -1 and lines[i].find("intersectia_5") != -1 and ( lines[i].find("strada_sase") < lines[i].find("intersectia_5"))):
                solution += [n, n]
            elif (lines[i].find("strada_sase") != -1 and lines[i].find("intersectia_4") != -1 and ( lines[i].find("strada_sase") < lines[i].find("intersectia_4"))):
                solution += [s, s]
 
            elif (lines[i].find("strada_sapte") != -1 and lines[i].find("intersectia_5") != -1 and ( lines[i].find("strada_sapte") < lines[i].find("intersectia_5"))):
                solution += [w, w]
            elif (lines[i].find("strada_sapte") != -1 and lines[i].find("intersectia_7") != -1 and ( lines[i].find("strada_sapte") < lines[i].find("intersectia_7"))):
                solution += [e, e]
 
            elif (lines[i].find("strada_opt") != -1 and lines[i].find("intersectia_6") != -1 and ( lines[i].find("strada_opt") < lines[i].find("intersectia_6"))):
                solution += [n, n]
            elif (lines[i].find("strada_opt") != -1 and lines[i].find("intersectia_7") != -1 and ( lines[i].find("strada_opt") < lines[i].find("intersectia_7"))):
                solution += [s, s]
        elif lines[i].find("umplere_rezervor")!=-1:
        	global check
        	check+=1

    print solution
    return solution
    util.raiseNotDefined()





def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""
    "*** YOUR CODE HERE ***"
    util.raiseNotDefined()

def uniformCostSearch(problem):
    """Search the node of least total cost first."""
    "*** YOUR CODE HERE ***"
    util.raiseNotDefined()

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem, heuristic=nullHeuristic):
    """Search the node that has the lowest combined cost and heuristic first."""
    "*** YOUR CODE HERE ***"
    util.raiseNotDefined()


# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
tx=taxi





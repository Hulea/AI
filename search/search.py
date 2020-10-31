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
import random

import util


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

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0



def depthFirstSearch(problem):

    primulNod = problem.getStartState()

    if problem.isGoalState(primulNod):
        return []

    stack = util.Stack()
    noduriVizitate = []
    stack.push((primulNod, []))

    while not stack.isEmpty():
        nodAux, directii = stack.pop()
        if nodAux not in noduriVizitate:
            noduriVizitate.append(nodAux)

            if problem.isGoalState(nodAux):
                return directii

            for urmatorul, directie, cost in problem.getSuccessors(nodAux):
                dirNoua = directii + [directie]
                stack.push((urmatorul, dirNoua))

def breadthFirstSearch(problem):
    primulNod = problem.getStartState()
    if problem.isGoalState(primulNod):
        return []

    q = util.Queue()
    noduriVizitate = []

    q.push((primulNod, []))

    while not q.isEmpty():
        nodAux, directii = q.pop()
        if nodAux not in noduriVizitate:
            noduriVizitate.append(nodAux)

            if problem.isGoalState(nodAux):
                return directii

            for urmatorul, directie, cost in problem.getSuccessors(nodAux):
                dirNoua = directii + [directie]
                q.push((urmatorul, dirNoua))


def uniformCostSearch(problem):
    nodAux = problem.getStartState()
    if problem.isGoalState(nodAux):
        return []

    noduriVizitate = []

    q = util.PriorityQueue()
    q.push((nodAux, [], 0), 0)

    while not q.isEmpty():

        nodAux, directii, prevCost = q.pop()
        if nodAux not in noduriVizitate:
            noduriVizitate.append(nodAux)

            if problem.isGoalState(nodAux):
                return directii

            for urmatorul, directie, cost in problem.getSuccessors(nodAux):
                dirNoua = directii + [directie]
                priority = prevCost + cost
                q.push((urmatorul, dirNoua, priority), priority)


def aStarSearch(problem, heuristic=nullHeuristic):
    nodAux = problem.getStartState()
    if problem.isGoalState(nodAux):
        return []

    noduriVizitate = []

    q = util.PriorityQueue()
    q.push((nodAux, [], 0), 0)

    while not q.isEmpty():

        nodAux, directii, prevCost = q.pop()

        if nodAux not in noduriVizitate:
            noduriVizitate.append(nodAux)

            if problem.isGoalState(nodAux):
                return directii

            for urmatorul, directie, cost in problem.getSuccessors(nodAux):
                dirNoua = directii + [directie]
                costNou = prevCost + cost
                heuristicCost = costNou + heuristic(urmatorul, problem)
                q.push((urmatorul, dirNoua, costNou), heuristicCost)
    util.raiseNotDefined()

def weightedAStarSearch(problem, heuristic=nullHeuristic):
    epsilon = 1

    #epsilon 1 a star
    #epsilon 0 ucs
    #epsilon infinit greedy
    nodAux = problem.getStartState()
    if problem.isGoalState(nodAux):
        return []

    noduriVizitate = []

    q = util.PriorityQueue()
    q.push((nodAux, [], 0), 0)

    while not q.isEmpty():

        nodAux, directii, prevCost = q.pop()

        if nodAux not in noduriVizitate:
            noduriVizitate.append(nodAux)

            if problem.isGoalState(nodAux):
                return directii

            for urmatorul, directie, cost in problem.getSuccessors(nodAux):
                dirNoua = directii + [directie]
                costNou = prevCost + cost
                heuristicCost = costNou + epsilon * heuristic(urmatorul, problem)
                q.push((urmatorul, dirNoua, costNou), heuristicCost)

def iterativeDeepeningDFS(problem):
    nodAux = problem.getStartState()
    if problem.isGoalState(nodAux):
        return []

    s = util.Stack()
    depth = 9999

    while True:

        noduriVizitate = []
        s.push((problem.getStartState(), [], 0))
        nodAux, directii, prevCost = s.pop()
        noduriVizitate.append(nodAux)

        while not problem.isGoalState(nodAux):
            for urmatorul, directie, cost in problem.getSuccessors(nodAux):
                if urmatorul not in noduriVizitate:
                    if prevCost + cost <= depth:
                        dirNoua = directii + [directie]
                        costNou = prevCost + cost
                        s.push((urmatorul, dirNoua, costNou))
                        noduriVizitate.append(urmatorul)
            if s.isEmpty():
                break
            else:
                nodAux, directii, prevCost = s.pop()

        if problem.isGoalState(nodAux):
            return directii
        else:
            depth = depth + 1

def iterativeDeepeningAStar(problem):
    from searchAgents import mazeDistance
    nodAux = problem.getStartState()
    if problem.isGoalState(nodAux):
        return []

    s = util.Stack()
    depth = 0

    while True:

        noduriVizitate = []
        s.push((problem.getStartState(), [], 0))
        nodAux, directii, prevCost = s.pop()
        noduriVizitate.append(nodAux)

        while not problem.isGoalState(nodAux):
            for urmatorul, directie, cost in problem.getSuccessors(nodAux):
                if urmatorul not in noduriVizitate:
                    if prevCost + cost <= depth:
                        dirNoua = directii + [directie]
                        costNou = prevCost + cost
                        s.push((urmatorul, dirNoua, costNou))
                        noduriVizitate.append(urmatorul)
            if s.isEmpty():
                break
            else:
                nodAux, directii, prevCost = s.pop()

        if problem.isGoalState(nodAux):
            return directii
        else:
            depth = depth + mazeDistance(nodAux, problem.goal, problem.state)


def randomSearch ( problem ):
    current = problem.getStartState()
    solution =[]
    while (not ( problem.isGoalState ( current ))):
        succ = problem.getSuccessors(current)
        no_of_successors = len(succ)
        random_succ_index = int(random . random ()* no_of_successors )
        next = succ [ random_succ_index ]
        current = next [0]
        solution.append(next[1])
    print "The solution is ", solution

# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
was = weightedAStarSearch
iddfs = iterativeDeepeningDFS
ita = iterativeDeepeningAStar

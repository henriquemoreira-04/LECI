import asyncio
import getpass
import json
import os
import websockets

from agent import Ia

async def agent_loop(server_address="localhost:8000", agent_name="james"):
    async with websockets.connect(f"ws://{server_address}/player") as websocket:
        await websocket.send(json.dumps({"cmd": "join", "name": agent_name}))

        agent = Ia(agent_name)

        while True:
            try:
                state = json.loads(await websocket.recv())
                print(state.get("bug_blaster"))
                key = agent.action(state)

                await websocket.send(json.dumps({"cmd": "key", "key": key}))

            except websockets.exceptions.ConnectionClosedOK:
                print("Server has cleanly disconnected us")
                break

loop = asyncio.get_event_loop()
SERVER = os.environ.get("SERVER", "localhost")
PORT = os.environ.get("PORT", "8000")
NAME = os.environ.get("NAME", getpass.getuser())
loop.run_until_complete(agent_loop(f"{SERVER}:{PORT}", NAME))

---------------------------------------------------
-- 脚本文件：scripts\skill\Quest\洛道_向斩萧标记.lua
---------------------------------------------------
--NPC死亡或被SetDisappearFrames设置时BUFF移除，在移除时设置场景变量

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	scene.SetCustomUnsigned4(30 * 4, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
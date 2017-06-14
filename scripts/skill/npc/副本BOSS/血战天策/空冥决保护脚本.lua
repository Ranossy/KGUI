---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/空冥决保护脚本.lua
-- 更新时间:	2015/10/15 20:29:25
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local nQuestID = 873
	local nQuestPhase = player.GetQuestPhase(nQuestID )
	if nQuestPhase == 3 then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID ~= 1 then
		return
	end
	if player.nLevel <= 15 then
		player.AddBuff(0, 99, 1160, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
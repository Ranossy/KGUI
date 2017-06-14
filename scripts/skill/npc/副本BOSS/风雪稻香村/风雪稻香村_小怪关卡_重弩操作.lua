---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_青骓牧场_药师观_重弩操作.lua
-- 更新时间:	2013/10/23 14:38:05
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nLeftFrame > 0 then
		if player.GetDynamicSkillGroup() == 164 then
			player.SetDynamicSkillGroup(0)
		end
		local npcZN = GetNpc(nCustomValue)
		if npcZN then
			npcZN.SetDialogFlag(1)
			npcZN.SetCustomBoolean(1, false)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
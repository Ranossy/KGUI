---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/屠龙六式禁疗监控.lua
-- 更新时间:	2017/3/13 15:49:47
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("liuguanjiao")
	if not npc then
		return
	end
	if player then
		if player.GetBuff(11733, 1) then
			local Nbuff = player.GetBuff(11733, 1)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				player.AddBuff(npc.dwID, npc.nLevel, 11791, 1)
				player.DelGroupBuff(11733, 1)
				player.AddBuff(npc.dwID, npc.nLevel, 11733, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
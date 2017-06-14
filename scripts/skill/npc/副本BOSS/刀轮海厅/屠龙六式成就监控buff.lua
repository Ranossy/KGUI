---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/屠龙六式成就监控buff.lua
-- 更新时间:	2017/3/22 18:52:47
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
		if player.GetBuff(11825, 1) then
			local Nbuff = player.GetBuff(11825, 1)
			local Num = Nbuff.nStackNum
			if Num == 3 then
				player.AddBuff(npc.dwID, npc.nLevel, 11826, 1)
				player.DelGroupBuff(11825, 1)
				player.AddBuff(npc.dwID, npc.nLevel, 11826, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
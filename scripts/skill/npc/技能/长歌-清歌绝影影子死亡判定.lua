---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/技能/长歌-清歌绝影影子死亡判定.lua
-- 更新时间:	2016/1/8 12:06:39
-- 更新用户:	mantong2
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/player/PlayerDeath.lua")

-- 死亡事件函数)
function OnDeath(npc, killer)
	--print(22222)
	local player = npc.GetEmployer()
	
	--if (player.GetScene().dwMapID ~= npc.GetScene().dwMapID) or (player.GetScene().dwID ~= npc.GetScene().dwID) then
		player.SetPosition(npc.nX, npc.nY, npc.nZ)
		--删除长歌自身的buff，并且切换状态
		--player.DelBuff(9506, 1)	--删除切换图标buff
		player.DelBuff(9691, 1)	--删除琴背上表现buff
		player.DelBuff(9695, 1)	--删除自身治疗吸收盾buff
		player.DelBuff(10014, 1)	--减伤闪避
		player.DelBuff(10015, 1)	--伤害转移
		--切换回琴正常姿态
		player.AddBuff(player.dwID, player.nLevel, 9692, 1)
		--删除影子
		--player.BreakOTSkill()
		player.CastSkill(15069, 1)
		--print(killer.dwID)
		player.DieByKiller(killer.dwID)
		ProcessFoeKill(player, killer)
		--npc.DelBuff(9697, 1)
		--npc.SetDisappearFrames(1, 0)
	--end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
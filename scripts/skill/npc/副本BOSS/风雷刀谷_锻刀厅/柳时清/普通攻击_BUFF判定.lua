---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_锻刀厅/柳时清/普通攻击_BUFF判定.lua
-- 更新时间:	2017/3/31 17:49:31
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	local tTarget = {}
	if scene then
		local tPlayerList = scene.GetAllPlayer()
		if tPlayerList and #tPlayerList ~= 0 then
			for i = 1, #tPlayerList do
				local playertar = GetPlayer(tPlayerList[i])
				if playertar and playertar.nMoveState ~= MOVE_STATE.ON_DEATH then
					if playertar.GetBuff(11749, 1) then
						table.insert(tTarget, playertar.dwID)
					end
				end
			end
		end
		--print(#tTarget)
		if scene.dwMapID == 263 or scene.dwMapID == 273 then
			if tTarget then
				if #tTarget >= 2 then
					npc.CastSkill(17423, 1)
				else
					npc.CastSkill(17423, 2)
				end
			end
		else
			if tTarget then
				if #tTarget >= 2 then
					npc.CastSkill(17423, 3)
				else
					npc.CastSkill(17423, 4)
				end
			end
		end
	end

end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
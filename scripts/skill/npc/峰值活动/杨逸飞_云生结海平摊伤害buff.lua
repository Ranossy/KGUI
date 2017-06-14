---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/峰值活动/杨逸飞_云生结海平摊伤害buff.lua
-- 更新时间:	2015/9/9 15:20:38
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
local SELFID = 9678
local SHIELD = 300000
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return	
	end
	local scene = player.GetScene()
	local npc = nil
	local nTotalUsedValue = 0
	local tAbsorbInfo = nil
	--print(tAbsorbInfo[1].nAbsorbType,tAbsorbInfo[1].nAbsorbValue,tAbsorbInfo[1].nAbsorbUsedValue)
	--if tAbsorbInfo[1].nAbsorbUsedValue >= 10000 then
	--npc.DelBuff(9346,1)
	--end
	for i = 1, 3 do
		npc = scene.GetNpcByNickName(player.dwID.."yangyifei_"..i)
		if npc then
			tAbsorbInfo = npc.GetAbsorbInfo()
		end
		if tAbsorbInfo and #tAbsorbInfo >= 1 then
			nTotalUsedValue = nTotalUsedValue + tAbsorbInfo[1].nAbsorbUsedValue
		end
	end
	tAbsorbInfo = player.GetAbsorbInfo()
	if tAbsorbInfo and #tAbsorbInfo >= 1 then
		for i = 1, #tAbsorbInfo do
			nTotalUsedValue = nTotalUsedValue + tAbsorbInfo[i].nAbsorbUsedValue
		end
	end
	if nTotalUsedValue < SHIELD then
		return
	end
	---删除操作
	for i = 1, 3 do
		npc = scene.GetNpcByNickName(player.dwID.."yangyifei_"..i)
		if npc then
			scene.DestroyNpc(npc.dwID)
		end
	end
	player.DelBuff(SELFID, 1)
	print(nTotalUsedValue)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
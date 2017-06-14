---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Carrier/Buff/载具主人记录时间到.lua
-- 更新时间:	2016/12/22 11:07:26
-- 更新用户:	wangsongtao-pc
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Map/阵营攻防载具/include/攻防载具_data.lua")

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	if nLeftFrame ~= 0 then
		return
	end
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	if not GetPlayer(nCustomValue) then -- 建造者不在线则直接让所有玩家都能操作
		return
	end
	npc.AddBuff(npc.dwID, npc.nLevel, CARRIERMASTERID_BUFF, 2, 15) -- 15秒队友可操作
	local nMasterBuff2 = npc.GetBuff(CARRIERMASTERID_BUFF, 2)
	if nMasterBuff2 then
		nMasterBuff2.nCustomValue = nCustomValue
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
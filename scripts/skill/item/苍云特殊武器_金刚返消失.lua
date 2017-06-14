---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/苍云特殊武器_金刚返消失.lua
-- 更新时间:	2016/3/24 14:42:48
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end

	local Xueliang1 = npc.GetCustomInteger4(16)
	local Xueliang2 = npc.nCurrentLife
	local num = Xueliang1 - Xueliang2
	if num >= npc.nMaxLife * 0.01 then
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.01
		npc.CastSkill(15665, 1)
	end

	if num < npc.nMaxLife * 0.01 then
		npc.nCurrentLife = npc.nCurrentLife + num
		npc.CastSkill(15666, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
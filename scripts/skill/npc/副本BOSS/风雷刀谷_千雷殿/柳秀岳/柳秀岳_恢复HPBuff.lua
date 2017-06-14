---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳秀岳/柳秀岳_恢复HPBuff.lua
-- 更新时间:	2017/3/8 10:58:09
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	--回血
	if npc.nCurrentLife >= npc.nMaxLife * 0.995 then
		npc.nCurrentLife = npc.nMaxLife
	else
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.005
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
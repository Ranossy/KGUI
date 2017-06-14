---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_令狐伤_千切子寒光_特效.lua
-- 更新时间:	2014/4/3 12:25:52
-- 更新用户:	xueyan-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪
-- 创建时间	:  2013-10-16
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nTime = 8
	local nBuff1 = player.GetBuff(7207, 1)
	if nBuff1 then
		nBuff1.nCustomValue = player.nZ
		nTime = 16
	end
	local nBuff2 = player.GetBuff(7207, 2)
	if nBuff2 then
		nBuff2.nCustomValue = player.nZ
		nTime = 16
	end
	local nBuff3 = player.GetBuff(7207, 3)
	if nBuff3 then
		nBuff3.nCustomValue = player.nZ
		nTime = 16
	end
	local nBuff4 = player.GetBuff(7207, 4)
	if nBuff4 then
		nBuff4.nCustomValue = player.nZ
		nTime = 16
	end

	player.SetTimer(nTime, "scripts/skill/npc/副本BOSS/血战天策/血战天策_令狐伤_千切子寒光_特效.lua", player.nX, player.nY)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- 一定时间后生效
	local nBuff1 = player.GetBuff(7207, 1)
	local nBuff2 = player.GetBuff(7207, 2)
	local nBuff3 = player.GetBuff(7207, 3)
	local nBuff4 = player.GetBuff(7207, 4)
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("linghushang")
	if not npc then
		return
	end
	if nBuff1 then
		npc.CastSkillXYZ(8311, 1, nParam1, nParam2, nBuff1.nCustomValue)
		player.DelBuff(7207, 1)
		player.PlaySfx(626, nParam1, nParam2, nBuff1.nCustomValue)
	end
	if nBuff2 then
		npc.CastSkillXYZ(8311, 2, nParam1, nParam2, nBuff2.nCustomValue)
		player.DelBuff(7207, 2)
		player.PlaySfx(626, nParam1, nParam2, nBuff2.nCustomValue)
	end
	if nBuff3 then
		npc.CastSkillXYZ(8311, 3, nParam1, nParam2, nBuff3.nCustomValue)
		player.DelBuff(7207, 3)
		player.PlaySfx(626, nParam1, nParam2, nBuff3.nCustomValue)
		--player.AddBuff(0, 99, 6964, 3)
		--player.AddBuff(0,99,7207,3)
	end
	if nBuff4 then
		npc.CastSkillXYZ(8311, 4, nParam1, nParam2, nBuff4.nCustomValue)
		player.DelBuff(7207, 4)
		player.PlaySfx(626, nParam1, nParam2, nBuff4.nCustomValue)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
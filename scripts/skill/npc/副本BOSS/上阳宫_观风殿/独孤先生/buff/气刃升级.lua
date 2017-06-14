---------------------------------------------------------------------->
-- 脚本名称:	scripts\skill\npc\副本BOSS\上阳宫_观风殿\独孤先生\buff\气刃升级.lua
-- 更新时间:	2014/7/14 17:06:43
-- 更新用户:	ZHENGYUCHAO
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Map/上阳宫_观风殿/include/独孤先生通用数据.lua")

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local npcSelf = GetNpc(dwCharacterID)
	if not npcSelf then
		return
	end
	
	local commonData = DuguData[npcSelf.GetMapID()]
	if not commonData then
		return
	end

	local buffLevel = 1

	local npcSaveLevel = npcSelf.GetCustomInteger1(14)
	if npcSaveLevel >= 1 and npcSaveLevel <= 4 then
		buffLevel = npcSaveLevel + 1
	end

	if buffLevel > 4 then
		buffLevel = 4
	end
	npcSelf.SetCustomInteger1(14, buffLevel)

	local kuangBaoBuff = npcSelf.GetBuff(commonData.SoftKuangBaoBuffID, 1)
	if kuangBaoBuff then
		npcSelf.AddBuff(npcSelf.dwID, npcSelf.nLevel, commonData.QRBuffID, buffLevel, commonData.SoftKuangBaoQRLevelAddTime)
	else
		npcSelf.AddBuff(npcSelf.dwID, npcSelf.nLevel, commonData.QRBuffID, buffLevel,commonData.QRLevelAddTime)
	end
end



-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
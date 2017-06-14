---------------------------------------------------------------------->
-- �ű�����:	scripts\skill\npc\����BOSS\������_�۷��\��������\buff\��������.lua
-- ����ʱ��:	2014/7/14 17:06:43
-- �����û�:	ZHENGYUCHAO
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Map/������_�۷��/include/��������ͨ������.lua")

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
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



-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/��������/buff/Ȫӿÿ������Ѫ��.lua
-- ����ʱ��:	2016/9/27 11:41:22
-- �����û�:	ZHENGYUCHAO
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Map/������_�۷��/include/��������ͨ������.lua")

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local targetPlayer = GetPlayer(dwCharacterID)
	if targetPlayer then
		local commonData = DuguData[targetPlayer.GetMapID()]
		if not commonData then
			return
		end

		local myBuff = targetPlayer.GetBuff(commonData.QYDebuffID, commonData.QYDebuffLevel)
		local hpRate = myBuff.nCustomValue / 100

		targetPlayer.nCurrentLife = targetPlayer.nMaxLife * hpRate
	end
end
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������������boss/��ʱ��/��ʱ��_data.lua
-- ����ʱ��:	2017/5/31 20:12:28
-- �����û�:	qingfupei
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Include/Table.lh")

--BOSS���������
WildBoss_LiuShiQing = {}
WildBoss_LiuShiQing.Boss = {}
WildBoss_LiuShiQing.Boss.dwID = 57101		--��������boss����
WildBoss_LiuShiQing.Boss.bombID = 57112	--���ϵĵ���
WildBoss_LiuShiQing.Boss.nJnzkID = 57127 --�����ܿ�NPCID
WildBoss_LiuShiQing.Boss.szNickName = "WildBoss_BKLJ"	--��������
WildBoss_LiuShiQing.Boss.szJnzkName = "WildBoss_LiuShiQing_JNZK"

--BOSS�ܿص�����
WildBoss_LiuShiQing.Control = {}
WildBoss_LiuShiQing.Control.dwID = 57103
WildBoss_LiuShiQing.Control.szNickName = "WildBoss_LiuShiQingZK"
WildBoss_LiuShiQing.Control.CustumValue = {ConvertProxiedTable = ConvertProxiedTable, -- �ܿ�
	dwBossID = {0, 3}, -- BossID
	dwFlag = {4, 4}, -- ��Ϊ0������״δ������׶�BOSS
};WildBoss_LiuShiQing.Control.CustumValue = WildBoss_LiuShiQing.Control.CustumValue:ConvertProxiedTable()


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
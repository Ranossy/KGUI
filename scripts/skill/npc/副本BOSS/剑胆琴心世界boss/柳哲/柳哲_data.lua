---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������������boss/����/����_data.lua
-- ����ʱ��:	2017/5/31 20:12:38
-- �����û�:	qingfupei
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Include/Table.lh")

--BOSS���������
WildBoss_LiuZhe = {}
WildBoss_LiuZhe.Boss = {}
WildBoss_LiuZhe.Boss.dwID = 57100		--boss����
WildBoss_LiuZhe.Boss.nJnzkID = 57129 --�����ܿ�NPCID
WildBoss_LiuZhe.Boss.nIceFireNpcID = 57130 --�����ܿ�NPCID
WildBoss_LiuZhe.Boss.szNickName = "WildBoss_LiuZhe"
WildBoss_LiuZhe.Boss.szJnzkName = "WildBoss_LiuZhe_JNZK"

--BOSS�ܿص�����
WildBoss_LiuZhe.Control = {}
WildBoss_LiuZhe.Control.dwID = 57104
WildBoss_LiuZhe.Control.szNickName = "WildBoss_LiuZheZK"
WildBoss_LiuZhe.Control.CustumValue = {ConvertProxiedTable = ConvertProxiedTable, -- �ܿ�
	dwBossID = {0, 3}, -- BossID
	dwFlag = {4, 4}, -- ��Ϊ0������״δ������׶�BOSS
	dwIceFireFlag = {5, 5}, -- ��һ�бؽӱ��𵶵ı�־
};WildBoss_LiuZhe.Control.CustumValue = WildBoss_LiuZhe.Control.CustumValue:ConvertProxiedTable()
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
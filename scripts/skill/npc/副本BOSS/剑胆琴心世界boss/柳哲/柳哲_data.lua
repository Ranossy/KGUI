---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/剑胆琴心世界boss/柳哲/柳哲_data.lua
-- 更新时间:	2017/5/31 20:12:38
-- 更新用户:	qingfupei
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Include/Table.lh")

--BOSS本体的数据
WildBoss_LiuZhe = {}
WildBoss_LiuZhe.Boss = {}
WildBoss_LiuZhe.Boss.dwID = 57100		--boss本尊
WildBoss_LiuZhe.Boss.nJnzkID = 57129 --技能总控NPCID
WildBoss_LiuZhe.Boss.nIceFireNpcID = 57130 --技能总控NPCID
WildBoss_LiuZhe.Boss.szNickName = "WildBoss_LiuZhe"
WildBoss_LiuZhe.Boss.szJnzkName = "WildBoss_LiuZhe_JNZK"

--BOSS总控的数据
WildBoss_LiuZhe.Control = {}
WildBoss_LiuZhe.Control.dwID = 57104
WildBoss_LiuZhe.Control.szNickName = "WildBoss_LiuZheZK"
WildBoss_LiuZhe.Control.CustumValue = {ConvertProxiedTable = ConvertProxiedTable, -- 总控
	dwBossID = {0, 3}, -- BossID
	dwFlag = {4, 4}, -- 不为0代表非首次创建二阶段BOSS
	dwIceFireFlag = {5, 5}, -- 下一招必接冰火刀的标志
};WildBoss_LiuZhe.Control.CustumValue = WildBoss_LiuZhe.Control.CustumValue:ConvertProxiedTable()
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
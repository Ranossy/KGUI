---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_游龙骑法_任驰骋.lua
-- 更新时间:	2013/6/6 20:46:19
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_游龙骑法_任驰骋.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-04-07
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  游龙骑法	
-- 技能名称  :  任驰骋
-- 技能效果  :  战斗中上马,能被打断,能被打下马
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		7,
		9999
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		244,
		1
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
	--ATTRIBUTE_TYPE.CALL_BUFF,
	--2756,
	--2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/天策/天策_游龙骑法_任驰骋.lua",
		0
	);
	--skill.BindBuff(1, 1018, 1);	
	skill.AddSlowCheckSelfBuff(2587, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
	skill.AddSlowCheckSelfBuff(3767, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); --烛龙殿特殊
	skill.AddSlowCheckSelfBuff(7682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 据点贸易任务中，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9469, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9470, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9471, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9520, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9521, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9522, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
--	skill.AddSlowCheckSelfBuff(10802, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 双人秋千监控BUFF，默认禁止骑乘
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 108);		--公共CD1秒
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= 11;
	skill.nCostManaBasePercent = 12;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度
	skill.nAreaRadius = 25 * LENGTH_BASE;
	skill.nPrepareFrames = 24;										--吟唱帧数,16帧等于1秒
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
    
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	local item = player.GetEquippedHorse()
	local nRideSkillLevel = player.GetSkillLevel(605)

	
	
	if item and nRideSkillLevel > 0 and item.dwIndex ~= 566 and item.dwIndex ~= 567 and item.dwIndex ~= 11105 and item.dwIndex ~= 11106 and item.dwIndex ~= 11649
		and item.dwIndex ~= 11770 and item.dwIndex ~= 11803 and item.dwIndex ~= 13704 and item.dwIndex ~= 13705 and item.dwIndex ~= 13788 and item.dwIndex ~= 13789
		and item.dwIndex ~= 13790 and item.dwIndex ~= 16894  and item.dwIndex ~= 18305 and item.dwIndex ~= 20176 and item.dwIndex ~= 20265 and item.dwIndex ~= 20986 and item.dwIndex ~= 21076 and item.dwIndex ~= 21077
		and item.dwIndex ~= 21102 then
		return nPreResult;
	else
		return false;
	end
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--[[
	print(123)
	print(player.bOnTowerFlag)
	--登顶就终止
	if player.bOnTowerFlag then
		return
	end
	print(456)
	--]]
	
	--[[
	if player.GetSkillLevel(6513) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 2756, 2, 1)
	end
	--]]

	player.AddBuff(dwCharacterID, player.nLevel, 2756, 2, 1)
	
	if player.GetSkillLevel(6780) == 1 then
		--for i = 1, 5 do
		player.AddBuff(dwCharacterID, player.nLevel, 6331, 1, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 6333, 1, 1)
		--end
	end

	--添加5层驰骋攻击buff
	for i = 1, 5 do
		player.AddBuff(dwCharacterID, player.nLevel, 6121, 1, 1)
	end

	--马匹属性·监控处理
	player.AddBuff(dwCharacterID, player.nLevel, 8475, 1)

	ModityCDToUI(player, 433, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/水枪的水花技能.lua
-- 更新时间:	2015/7/1 1:48:45
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

	--附魔效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/挂件相关/水枪的水花技能.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	skill.SetCheckCoolDown(1, 444);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 28;				-- 吟唱帧数
	skill.nMinPrepareFrames = 1;-- 吟唱帧数

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if player.dwBackItemIndex ~= 13905 and player.dwBackItemIndex ~= 13906 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end
	--检查水量
	local nValue_XIAOHAO = 40
	--获取水量-----------------------------------------------------
	local nValue_SHUILIANG = 0
	local nValue_buffid = 0
	for i = 9093, 9102 do
		local buff = player.GetBuff(i, 1)
		if buff then
			nValue_buffid = i
			break
		end
	end
	if nValue_buffid ~= 0 then
		nValue_SHUILIANG = (nValue_buffid - 9093 + 1) * 20
	end
	---------------------------------------------------------------
	if nValue_SHUILIANG < nValue_XIAOHAO then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7466), 4)
		return false
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	----------------------------
	local nValue_XIAOHAO = 40
	--减水量---------------------------------------------------------------------------
	--获取水量---------------------------------------
	local nValue_SHUILIANG = 0
	local nValue_buffid = 0
	for i = 9093, 9102 do
		local buff = player.GetBuff(i, 1)
		if buff then
			nValue_buffid = i
			break
		end
	end
	if nValue_buffid ~= 0 then
		nValue_SHUILIANG = (nValue_buffid - 9093 + 1) * 20
	end
	------------------------------------------------
	if nValue_SHUILIANG < nValue_XIAOHAO then
		return
	end
	local nValue_NOW = nValue_SHUILIANG - nValue_XIAOHAO
	if nValue_NOW == 0 then
		player.DelBuff(nValue_buffid, 1)
	elseif nValue_NOW > 0 then
		player.DelBuff(nValue_buffid, 1)
		-----------------
		--水量转buff
		local nBuff_NOW = nValue_NOW / 20 - 1 + 9093
		if nBuff_NOW >= 9093 and nBuff_NOW <= 9102 then
			player.AddBuff(0, 99, nBuff_NOW, 1)
		end
		-----------------
	end
	---------------------------------------------------------------------------------------
	player.SetTimer(1 * 16, "scripts/skill/装备/挂件相关/水枪的水花技能.lua", 0, 0)
	---------------------------------------------------
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	
	--面前5米处创建一个水花特效-------------------------
	local nX, nY, nZ = player.GetAbsoluteCoordinate()
	local scene = player.GetScene()
		if scene then
		local nR = 64 * 7
		local dwAngel = (player.nFaceDirection * 360 / 256) / 180 * 3.14159265
		local X_value = nX + nR * math.cos(dwAngel)
		local Y_value = nY + nR * math.sin(dwAngel)
		local Z_value = nZ
		--scene.CreateNpc(44048, X_value, Y_value, Z_value, 0, 16 * 10)	
		player.PlaySfx(1144, X_value, Y_value, Z_value)
	end
	---------------------------------------------------
	----------------------------
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
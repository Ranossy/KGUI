---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�ٻ���Ѩ��_��ʯ���.lua
-- ����ʱ��:	2013/11/26 11:18:17
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_��Ѩ����_��ʯ���.lua
-- ������    :  �Ͻ�	
-- ����ʱ��  :  2008-8-12
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ˲������
-- �书��·  :  ��Ѩ����
-- ��������  :  ��ʯ���
-- ����Ч��  :  ���������ڹ��˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 20, nDamageRand = 1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 22, nDamageRand = 1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 24, nDamageRand = 1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 28, nDamageRand = 2, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 30, nDamageRand = 2, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 32, nDamageRand = 2, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 34, nDamageRand = 3, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 36, nDamageRand = 3, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, nDamageRand = 3, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, nDamageRand = 4, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42, nDamageRand = 4, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, nDamageRand = 4, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, nDamageRand = 5, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48, nDamageRand = 5, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, nDamageRand = 5, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, nDamageRand = 6, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, nDamageRand = 6, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 56, nDamageRand = 6, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, nDamageRand = 7, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 60, nDamageRand = 7, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 62, nDamageRand = 7, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 64, nDamageRand = 8, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 66, nDamageRand = 8, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 68, nDamageRand = 8, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, nDamageRand = 9, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 72, nDamageRand = 9, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, nDamageRand = 9, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 78, nDamageRand = 10, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, nDamageRand = 10, }, -- Level 29 
};  

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_�ٻ���Ѩ��_��ʯ���.lua", -- ��Э��
		0
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/90����Ѩ/��ʯ�ж�dot����.lua", -- ��Э��
		0
	);
   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase, -- ����ֵ1
		0																-- ����ֵ2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand, -- ����ֵ1
		0																-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
	);
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
	--714, -- ����ֵ1
	--0																-- ����ֵ2
	--);
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
	--674, -- ����ֵ1
	--0																-- ����ֵ2
	--);
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
	--666, -- ����ֵ1
	--0																-- ����ֵ2
	--);
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
	--711, -- ����ֵ1
	--0																-- ����ֵ2
	--);
   		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
	--2738, -- ����ֵ1
	--0																-- ����ֵ2
	--);
   		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
	--2740, -- ����ֵ1
	--0																-- ����ֵ2
	--);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_�߾�����.lua", -- ��Э��
		0
	);
    
	skill.AddAttribute(														--70����
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3086,
		1
	);
	skill.AddAttribute(														--80����
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1862,
		1
	);
	skill.AddAttribute(														--90����
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3086,
		2
	);
	skill.AddAttribute(														--95����
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3086,
		3
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	skill.SetNormalCoolDown(1, 176);
	skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 609 *0.5 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 609*0.5 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 609*0.5 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 609*0.5 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 609*0.5;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	skill.nChannelInterval = 64; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(44)
	end
	-- if player.IsAchievementAcquired(43) and player.IsAchievementAcquired(44) and player.IsAchievementAcquired(45) and player.IsAchievementAcquired(46) and player.IsAchievementAcquired(47) and player.IsAchievementAcquired(48) then
	-- player.AcquireAchievement(69)
	-- end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local t1, t2, t3, t4, t5, t6
	t1 = 0
	t2 = 0
	t3 = 0
	t4 = 0
	t5 = 0
	t6 = 0
	local lv = 0
	local target
	--if player.GetSkillLevel(5752) == 1 then
	target = player.GetSelectCharacter()
	if not target then
		return
	end
	target.AddBuff(dwCharacterID, player.nLevel, 5691, 1)
	player.CastSkill(6126, 2)
	if player.GetBuff(5850, 1) then
		t1 = 1
	end
	if not t1 == 1 then
		player.CastSkill(6127, 2)
		if player.GetBuff(5850, 1) then
			t2 = 1
		end
	end
	player.CastSkill(6128, 2)
	if player.GetBuff(5851, 1) then
		t3 = 1
	end
	player.CastSkill(6129, 2)
	if player.GetBuff(5852, 1) then
		t4 = 1
	end
	if not t4 == 1 then
		player.CastSkill(6130, 2)
		if player.GetBuff(5852, 1) then
			t5 = 1
		end
	end
	if (not t4 == 1) and (not t5 == 1) then
		player.CastSkill(6131, 2)
		if player.GetBuff(5852, 1) then
			t6 = 1
		end
	end
	if t1 == 1 or t2 == 1 then
		lv = lv + 1
	end
	if t3 == 1 then
		lv = lv + 1
	end
	if t4 == 1 or t5 == 1 or t6 == 1 then
		lv = lv + 1
	end
	--[[
	--��ʯAOE
	if player.GetSkillLevel(5752) == 1 then
		if lv ~= 0 then
			player.CastSkillXYZ(6133, lv, target.nX, target.nY, target.nZ)
			player.PlaySfx(473 + lv, target.nX, target.nY, target.nZ + 500)
		end
	end
	--]]
	
	--��ʯ��˲������
	if player.GetSkillLevel(6682) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 6371, 1, 1)
	end

	--��ʯ�������AP
	--print(1111)
	if player.GetSkillLevel(16855) == 1 then
		--player.CastSkill(16856, 1)
		player.AddBuff(player.dwID, player.nLevel, 11269, 1)
	end

	--��ʯ������Ŀ������ȼ�
	if player.GetSkillLevel(17510) == 1 then
		--player.CastSkill(16856, 1)
		player.AddBuff(player.dwID, player.nLevel, 11809, 1)
	end
	
	
	--[[
	if player.GetSkillLevel(5754) == 1 then
		if lv ~= 0 then
			for i = 1, lv * 3 do
				player.AddBuff(player.dwID, player.nLevel, 7691, 1)
			end
		end
	end
	--]]

	--�������Ч��
	if player.GetSkillLevel(5754) == 1 then
		if lv ~= 0 then
			for i = 1, lv do
				player.AddBuff(player.dwID, player.nLevel, 9728, 1)
			end
		end
	end

	--����һ������Ч��35%���ʶ���4��
	if player.GetSkillLevel(5751) == 1 then
		--print(222222)
		local nRnd = Random(1, 10000)
		local nChance = 3500 * lv
		--print(nRnd)
		--print(nChance)
		if nRnd <= nChance then
			--print(player.CastSkill(1127, 1, player.GetSkillTarget()))
			player.CastSkill(1127, 1)
		end
	end

	--��ʯÿ����һ��dot����Ϣʱ�併��1.5��
	if player.GetSkillLevel(6683) == 1 then
		if lv ~= 0 then
			for i = 1, lv do
				player.CastSkill(14652, 1)	--��ʯ��Ϣʱ�併��1.5��
				ModityCDToUI(player, 182, 0, 0)
			end
		end
	end

	--����ʯAOE��������Ŀ�����ϳ����˺�Ч��
	if player.GetSkillLevel(5752) == 1 then
		--target.AddBuff(player.dwID, player.nLevel, 9729, 1)	--�����õ�ǰĿ��
		--player.CastSkill(14651, 1)	--Ŀ�귶ΧAOE�����ɳ����˺�
		--print(11111)
		player.CastSkillXYZ(14651, 1, target.nX, target.nY, target.nZ + 948)
	end
	
	--[[
	--������Ϣ��Ѩ
	local nbuffcount = lv * 3
	local nbuffcount_1 = math.floor(lv*1.5)
	if player.GetSkillLevel(6686) == 1 then
		if target.GetBuff(9173, 1) then
			return
		elseif target.GetBuff(9172, 1) then
			if nbuffcount >= 4 then
				target.AddBuff(0, 99, 9175, 1, nbuffcount_1)
				target.DelBuff(9172, 1)
				target.AddBuff(0, 99, 9173, 1)
			else
				target.AddBuff(0, 99, 9175, 1, nbuffcount)
			end
		else
			target.AddBuff(0, 99, 9175, 1, nbuffcount)
			if nbuffcount >= 4 then
				target.AddBuff(0, 99, 9172, 1)
			end
		end
	end
	--]]
	ModityCDToUI(player, 182, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
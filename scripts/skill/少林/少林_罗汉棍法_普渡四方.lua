---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_�޺�����_�ն��ķ�.lua
-- ����ʱ��:	2013/5/30 20:19:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_�޺�����_�ն��ķ�
-- ������    :  �º���
-- ����ʱ��  :  2008-07-18
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �޺�����
-- ��������  :  ������
-- ����Ч��  :  ��Ŀ������⹦�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 23, 	nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 27, 	nDamageRand = 5}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 31, 	nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, 	nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 43, 	nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, 	nDamageRand = 5}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, 	nDamageRand = 5}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 5}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 123*0.5, 	nDamageRand = 10}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133*0.5, 	nDamageRand = 10}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 143*0.5, 	nDamageRand = 10}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153*0.5, 	nDamageRand = 10}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 163*0.5, 	nDamageRand = 10}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 173*0.5, 	nDamageRand = 10}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 183*0.5, 	nDamageRand = 10}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 193*0.5, 	nDamageRand = 10}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 203*0.5, 	nDamageRand = 10}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 213*0.5, 	nDamageRand = 15}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 223*0.5, 	nDamageRand = 15}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 233*0.5, 	nDamageRand = 15}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 243*0.5, 	nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 253*0.5, 	nDamageRand = 15}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 263*0.5, 	nDamageRand = 15}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 273*0.5, 	nDamageRand = 15}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 283*0.5, 	nDamageRand = 15}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 293*0.5, 	nDamageRand = 15}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 303*0.5, 	nDamageRand = 15}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 313*0.5, 	nDamageRand = 15}, -- Level 28 
};
tPit = 
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}   
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
--����100%�����˺� 
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/����_�޺�����_�ն��ķ�.lua", -- ����ֵ1
		0														-- ����ֵ2
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
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 60);
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 184*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 184 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 184 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 184 * 0.8;
	else
		skill.nCostManaBasePercent = 184;
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 16*1.1*1.15;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 9) * 6)*1.1*1.15
	else
		skill.nChannelInterval = 128*1.1*1.15;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 128;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	nWeaponDamagePercent = 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	--��������ָ������
	local nQuestIndex = player.GetQuestIndex(13246)
	local nQuestPhase = player.GetQuestPhase(13246)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end

	if player.GetSkillLevel(16890) == 1 then
		local nLev = player.GetSkillLevel(232)
		if nLev ~= 0 then
			target.AddBuff(player.dwID, player.nLevel, 11295, 1)
			player.CastSkillXYZ(16892, nLev, target.nX, target.nY, target.nZ)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
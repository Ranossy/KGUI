---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���ӽ���_��������.lua
-- ����ʱ��:	2013/5/31 1:06:01
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_���ӽ���_��������
-- ������    :  �º���
-- ����ʱ��  :  2008-08-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ���ӽ���
-- ��������  :  ��������
-- ����Ч��  :  ���С���˺�����һ���������˺�ת������ת�Ƹ�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 40 * 0.95, nDamageRand = 40 * 0.1, nCostMana = 65, nDamToMana = 51}, --level 1
	{nDamage = 66 * 0.95, nDamageRand = 66 * 0.1, nCostMana = 65, nDamToMana = 51}, --level 1
	{nDamage = 85 * 0.95, nDamageRand = 85 * 0.1, nCostMana = 76, nDamToMana = 51}, --level 2
	{nDamage = 103 * 0.95, nDamageRand = 103 * 0.1, nCostMana = 91, nDamToMana = 51}, --level 3
	{nDamage = 121 * 0.95, nDamageRand = 121 * 0.1, nCostMana = 106, nDamToMana = 51}, --level 4
	{nDamage = 139 * 0.95, nDamageRand = 139 * 0.1, nCostMana = 121, nDamToMana = 51}, --level 5
	{nDamage = 154 * 0.95, nDamageRand = 154 * 0.1, nCostMana = 136, nDamToMana = 51}, --level 6
	{nDamage = 168 * 0.95, nDamageRand = 168 * 0.1, nCostMana = 151, nDamToMana = 51}, --level 7
	{nDamage = 181 * 0.95, nDamageRand = 181 * 0.1, nCostMana = 166, nDamToMana = 51}, --level 8
	{nDamage = 193 * 0.95, nDamageRand = 193 * 0.1, nCostMana = 181, nDamToMana = 51}, --level 9
	{nDamage = 204 * 0.95, nDamageRand = 204 * 0.1, nCostMana = 196, nDamToMana = 51}, --level 10
	{nDamage = 215 * 0.95, nDamageRand = 215 * 0.1, nCostMana = 196, nDamToMana = 51}, --level 12
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
}   
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
	--2920, -- ����ֵ1
	--0																-- ����ֵ2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/���ӽ���_��������.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
	--tSkillData[dwSkillLevel].nDamage * (1 - tPit[dwSkillLevel].nReducePercent),
	--0
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
	--tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent),
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
	--0,
	--0
	--);
	
	--skill.nDamageToManaForParty = tSkillData[dwSkillLevel].nDamToMana; --�˺��ٷֱ�ת��������
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(409, 1, 2);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfBuff(693, 0, BUFF_COMPARE_FLAG.EQUAL)   --������������BUFF
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 683, 1);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);
	--skill.SetNormalCoolDown(1, 68);


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
		skill.nCostManaBasePercent = 354*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 354 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 16 then
		skill.nCostManaBasePercent = 354 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 354 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 354;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--   skill.bIsAccumulate	= true;				-- �����Ƿ���Ҫ����
	--   skill.SetSubsectionSkill(1, 1, 211, dwSkillLevel);
	--   skill.SetSubsectionSkill(2, 2, 212, dwSkillLevel);
	--   skill.SetSubsectionSkill(3, 10, 213, dwSkillLevel);
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= tSkillData[dwSkillLevel].nLength * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  		= 0;				-- ����֡��
	skill.nChannelInterval = 64; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 48;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	skill.nBulletVelocity = 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(553)
	--������������˺�
	--[[
	if player.GetSkillLevel(6558) == 1 then
		player.CastSkill(6560, lv)
	end
	--]]

	--�и�ħ���buff�����������ɲ�ͬ������buff
	if player.GetSkillLevel(9345) == 1 then
		player.CastSkill(9427, lv)
	else
		player.CastSkill(6559, lv)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
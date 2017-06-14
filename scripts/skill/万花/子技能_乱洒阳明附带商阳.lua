---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_��Ѩ����_����ָ.lua
-- ����ʱ��:	2013/6/2 23:00:44
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_��Ѩ����_����ָ.lua
-- ������    :  �Ͻ�	
-- ����ʱ��  :  2008-8-12
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ˲������
-- �书��·  :  ��Ѩ����
-- ��������  :  ����ָ
-- ����Ч��  :  Զ�������ڹ��˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 26, nDotID = 666, nDotLevel = 1 }, -- Level 1
	{nCostMana = 38, nDotID = 666, nDotLevel = 2 }, -- Level 2
	{nCostMana = 53, nDotID = 666, nDotLevel = 3 }, -- Level 3
	{nCostMana = 74, nDotID = 666, nDotLevel = 4 }, -- Level 4
	{nCostMana = 90, nDotID = 666, nDotLevel = 5 }, -- Level 5
	{nCostMana = 106, nDotID = 666, nDotLevel = 6 }, -- Level 6
	{nCostMana = 122, nDotID = 666, nDotLevel = 7 }, -- Level 7
	{nCostMana = 138, nDotID = 666, nDotLevel = 8 }, -- Level 8
	{nCostMana = 154, nDotID = 666, nDotLevel = 9 }, -- Level 9
	{nCostMana = 170, nDotID = 666, nDotLevel = 10 }, -- Level 10
	{nCostMana = 170, nDotID = 666, nDotLevel = 11 }, -- Level 10
	{nCostMana = 170, nDotID = 666, nDotLevel = 12 }, -- Level 10
	{nCostMana = 170, nDotID = 666, nDotLevel = 13 }, -- Level 13
	{nCostMana = 26, nDotID = 666, nDotLevel = 14 }, -- Level 14
	{nCostMana = 38, nDotID = 666, nDotLevel = 15 }, -- Level 15
	{nCostMana = 53, nDotID = 666, nDotLevel = 16 }, -- Level 16
	{nCostMana = 74, nDotID = 666, nDotLevel = 17 }, -- Level 17
	{nCostMana = 90, nDotID = 666, nDotLevel = 18 }, -- Level 18
	{nCostMana = 106, nDotID = 666, nDotLevel = 19 }, -- Level 19
	{nCostMana = 122, nDotID = 666, nDotLevel = 20 }, -- Level 20
	{nCostMana = 138, nDotID = 666, nDotLevel = 21 }, -- Level 21
	{nCostMana = 154, nDotID = 666, nDotLevel = 22 }, -- Level 22
	{nCostMana = 170, nDotID = 666, nDotLevel = 23 }, -- Level 23
	{nCostMana = 170, nDotID = 666, nDotLevel = 24 }, -- Level 24
	{nCostMana = 170, nDotID = 666, nDotLevel = 25 }, -- Level 25
	{nCostMana = 170, nDotID = 666, nDotLevel = 26 }, -- Level 26
	{nCostMana = 170, nDotID = 666, nDotLevel = 27 }, -- Level 27
	{nCostMana = 170, nDotID = 666, nDotLevel = 28 }, -- Level 28
	{nCostMana = 170, nDotID = 666, nDotLevel = 29 }, -- Level 29
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
--���Ӷ����ڹ�AP�ӳ�2��

	----------------- ħ������ -------------------------------------------------
	skill.BindBuff(1, 666, tSkillData[dwSkillLevel].nDotLevel);
	skill.BindBuff(2, 8488, 1);		-- ����Debuff
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,								-- ħ������
   		tSkillData[dwSkillLevel].nDamageBase,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
    
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,							-- ħ������
   		tSkillData[dwSkillLevel].nDamageRand,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,								-- ħ������
   		0,																-- ����ֵ1
   		0																-- ����ֵ2
   		);
   	--]]	

    
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
	--skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	--skill.SetNormalCoolDown(1, 175);
	--skill.SetCheckCoolDown(1, 444)

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--	skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64*0.9*1.25*1.15;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 4)*0.9*1.25*1.15
	else
		skill.nChannelInterval =161*0.9*1.25*1.15;     -- ͨ�������ʱ��   
	end
	
	--skill.nChannelInterval = 161; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 85;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
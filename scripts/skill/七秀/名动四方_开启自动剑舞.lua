------------------------------------------------
-- �ļ���    :  ����_���ӽ���_�����ķ�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-8-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ���ӽ���
-- ��������  :  �����ķ�
-- ����Ч��  :  ���뽣��״̬
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
		{nCostMana = 10,nBuffLevel = 1},
		{nCostMana = 10,nBuffLevel = 6},
		{nCostMana = 10,nBuffLevel = 11},
		{nCostMana = 10,nBuffLevel = 16},
		{nCostMana = 10,nBuffLevel = 21},
		{nCostMana = 10,nBuffLevel = 26},
		{nCostMana = 10,nBuffLevel = 31}
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)


    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2341,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		2352, 												--�ӽ���BUFF
		dwSkillLevel
	);	

	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		--ATTRIBUTE_TYPE.CALL_BUFF,
		--2353, 												--������BUFF
		--dwSkillLevel
	--);	
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    skill.AddSlowCheckSelfBuff(409, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff �Լ��Ѿ��н��������ͷ������ķ�
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);				-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  --skill.BindBuff(1, 683, dwSkillLevel)			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(1, 199);						-- ����CD 1.5��

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
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  		= 0;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
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
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
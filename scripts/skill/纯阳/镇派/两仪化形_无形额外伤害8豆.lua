------------------------------------------------
-- ������    :  ֣����
-- ����ʱ��  :  20111111
-- ��;(ģ��):  �书����

------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 560, 	nDamageRand = 0 , 	nCostMana = 41}, 	--level 1
	{ nDamageBase = 560, 	nDamageRand = 0 , 	nCostMana = 74}, 	--level 2
	{ nDamageBase = 560, 	nDamageRand = 0 , 	nCostMana = 127},	--level 3
	{ nDamageBase = 560, 	nDamageRand = 0 , 	nCostMana = 164},	--level 4
	{ nDamageBase = 560, 	nDamageRand = 0 , 	nCostMana = 200},	--level 5
	{ nDamageBase = 560, 	nDamageRand = 0 , 	nCostMana = 237},	--level 6
	{ nDamageBase = 560, 	nDamageRand = 0 , 	nCostMana = 273},	--level 7
	{ nDamageBase = 560,    nDamageRand = 0, nCostMana = 0},		--level 8
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel 	= skill.dwLevel;
    local nSubsection 	= 8;
    
   	----------------- ħ������ -------------------------------------------------
   	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
        ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE,				-- ��Ԫ���ļ���
        1000*dwSkillLevel, 							
        0			
        );		
   		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.MAGIC_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,				
	    100*dwSkillLevel,
        0
	);      	
   	
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,							-- ħ������
   		tSkillData[dwSkillLevel].nDamageBase * nSubsection/10,			-- ����ֵ1
   		0																-- ����ֵ2
   		);
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,						-- ħ������
   		tSkillData[dwSkillLevel].nDamageRand *  nSubsection/10,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
    
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,								-- ħ������
   		0,																-- ����ֵ1
   		0																-- ����ֵ2
   		);

	skill.AddAttribute(														--2010.05.08��ӳ��似��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1864,
		1
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(3437, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetPublicCoolDown(16);						--����CD 1.5��
    --skill.SetNormalCoolDown(1, 489);

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
	--skill.nMinRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 22 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    skill.nChannelInterval	= 9 * nSubsection; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame			= 0;	-- ͨ��������ʱ�䣬��λ֡�� 
    -- ������ͨ��ʱ����Ϊ����AP���ݾ���ʱ��������Ч��
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    skill.nBrokenRate         	= PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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
------------------------------------------------
-- �ļ���    :  ����ɽ��_NPC_������_˫�³���.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-04-20
-- ��;(ģ��):  ����NPC����
-- �书����  :  ����ɽ��
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ����������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 200 *0.8, nTherapyRand = 200  *0.4, nCostMana = 50   }, 
	{ nTherapyBase = 339 *0.8, nTherapyRand = 339  *0.4, nCostMana = 85   },
	{ nTherapyBase = 486 *0.8, nTherapyRand = 486  *0.4, nCostMana = 121  },
	{ nTherapyBase = 707 *0.8, nTherapyRand = 707  *0.4, nCostMana = 177  },
	{ nTherapyBase = 928 *0.8, nTherapyRand = 928  *0.4, nCostMana = 232  },
	{ nTherapyBase = 1276*0.8, nTherapyRand = 1276 *0.4, nCostMana = 319  },
	{ nTherapyBase = 1522*0.8, nTherapyRand = 1522 *0.4, nCostMana = 380  }, 
	{ nTherapyBase = 1767*0.8, nTherapyRand = 1767 *0.4, nCostMana = 442  },
	{ nTherapyBase = 2013*0.8, nTherapyRand = 2013 *0.4, nCostMana = 503  },
	{ nTherapyBase = 2258*0.8, nTherapyRand = 2258 *0.4, nCostMana = 564  },
	{ nTherapyBase = 2503*0.8, nTherapyRand = 2503 *0.4, nCostMana = 626  },
	{ nTherapyBase = 2749*0.8, nTherapyRand = 2749 *0.4, nCostMana = 687  },
	{ nTherapyBase = 2994*0.8, nTherapyRand = 2994 *0.4, nCostMana = 749  }, 
	{ nTherapyBase = 3240*0.8, nTherapyRand = 3240 *0.4, nCostMana = 810  },
	{ nTherapyBase = 3485*0.8, nTherapyRand = 3485 *0.4, nCostMana = 871  },
	{ nTherapyBase = 3731*0.8, nTherapyRand = 3731 *0.4, nCostMana = 933  },
	{ nTherapyBase = 3976*0.8, nTherapyRand = 3976 *0.4, nCostMana = 994  },
	{ nTherapyBase = 4222*0.8, nTherapyRand = 4222 *0.4, nCostMana = 1055 },
	{ nTherapyBase = 4467*0.8, nTherapyRand = 4467 *0.4, nCostMana = 1117 },
	{ nTherapyBase = 4713*0.8, nTherapyRand = 4713 *0.4, nCostMana = 1178 },
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	
   	----------------- ħ������ -------------------------------------------------
	--ʩ�� �Ӽ���_�������󷨵�����
 	
  	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
  		ATTRIBUTE_TYPE.SKILL_THERAPY,									-- ħ������
  		tSkillData[dwSkillLevel].nTherapyBase, 							--����ֵ1
  		0																--����ֵ2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
  		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,								-- ħ������
  		tSkillData[dwSkillLevel].nTherapyRand, 							--����ֵ1
  		0																--����ֵ2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,						-- ��������ģʽ
  		ATTRIBUTE_TYPE.CALL_THERAPY,								-- ħ������
  		0,							--����ֵ1
  		0							--����ֵ2
 		);
    
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(1, 592, 1);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    skill.SetPublicCoolDown(16);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
    --skill.nCostRage		= 0;					-- �������ĵ�ŭ��
    --skill.nCostStamina	= 0;					-- �������ĵ�����
    --skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 32;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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